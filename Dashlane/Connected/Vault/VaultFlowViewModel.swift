import Combine
import CoreFeature
import CorePersonalData
import CorePremium
import CoreUserTracking
import Foundation
import NotificationKit
import SwiftTreats
import SwiftUI
import UIDelight
import UIKit
import VaultKit

@MainActor
final class VaultFlowViewModel: ObservableObject, SessionServicesInjecting, AutoFillDemoHandler {
  enum Action {
    case showAutofillDemo
    case showAuthenticatorSunsetPage
    case showChecklist
    case addItemOfCategory(_ category: ItemCategory)
    case didSelectItem(
      _ item: VaultItem, selectVaultItem: UserEvent.SelectVaultItem, isEditing: Bool)
    case addItem(displayMode: AddItemFlowViewModel.DisplayMode)
  }

  enum Mode {
    case allItems((OnboardingChecklistFlowViewModel.Action) -> Void)

    case category(ItemCategory)

    var isShowingAllItems: Bool {
      switch self {
      case .allItems:
        return true
      default:
        return false
      }
    }
  }

  enum Step {
    case home((OnboardingChecklistFlowViewModel.Action) -> Void)

    case vaultList(ItemCategory)

    case vaultDetail(VaultItem, ItemDetailViewType)

    case autofillDemoDummyFields(Credential)

    case authenticatorSunset
  }

  @Published
  var steps: [Step] = []

  @Published
  var navigationBarStyle: UIDelight.NavigationBarStyle = .default

  @Published
  var showAddItemFlow: Bool = false

  @Published
  var showAutofillFlow: Bool = false

  @Published
  var showOnboardingChecklist: Bool = false

  @Published
  var autofillDemoDummyFieldsCredential: Credential?

  @Published
  var activeFilter: ItemCategory?

  lazy var viewController: UIViewController = {
    UIHostingController(
      rootView: NavigationView {
        VaultFlow(viewModel: self)
      }
      .navigationViewStyle(.stack)
      .navigationBarHidden(true)
    )
  }()

  private(set) var mode: Mode!

  @Published
  var categoryItemsCount: Int = 0
  let actionPublisher: PassthroughSubject<CredentialDetailViewModel.Action, Never> = .init()

  private var cancellables: Set<AnyCancellable> = []

  private let detailViewModelFactory: VaultDetailViewModel.Factory
  private let homeViewModelFactory: HomeViewModel.Factory
  private let vaultListViewModelFactory: VaultListViewModel.Factory
  let addItemFlowViewModelFactory: AddItemFlowViewModel.Factory
  let autofillOnboardingFlowViewModelFactory: AutofillOnboardingFlowViewModel.Factory
  let onboardingChecklistFlowViewModelFactory: OnboardingChecklistFlowViewModel.Factory
  let onboardingChecklistViewAction: ((OnboardingChecklistFlowViewModel.Action) -> Void)?

  var addItemFlowDisplayMode: AddItemFlowViewModel.DisplayMode = .prefilledPassword(.init())

  private let accessControl: AccessControlProtocol
  private let userSpacesService: UserSpacesService
  private let activityReporter: ActivityReporterProtocol
  let vaultItemsStore: VaultItemsStore
  let vaultItemDatabase: VaultItemDatabaseProtocol
  let vaultItemsLimitService: VaultItemsLimitServiceProtocol
  let deepLinkingService: DeepLinkingServiceProtocol

  private let categoryCountQueue = DispatchQueue(label: "vaultCategoryCount", qos: .utility)

  let deeplinkPublisher: AnyPublisher<VaultDeeplink, Never>

  init(
    itemCategory: ItemCategory? = nil,
    onboardingChecklistViewAction: ((OnboardingChecklistFlowViewModel.Action) -> Void)? = nil,
    deepLinkingService: DeepLinkingServiceProtocol,
    vaultItemsStore: VaultItemsStore,
    vaultItemDatabase: VaultItemDatabaseProtocol,
    vaultItemsLimitService: VaultItemsLimitServiceProtocol,
    accessControl: AccessControlProtocol,
    userSpacesService: UserSpacesService,
    activityReporter: ActivityReporterProtocol,
    detailViewModelFactory: VaultDetailViewModel.Factory,
    homeViewModelFactory: HomeViewModel.Factory,
    vaultListViewModelFactory: VaultListViewModel.Factory,
    addItemFlowViewModelFactory: AddItemFlowViewModel.Factory,
    autofillOnboardingFlowViewModelFactory: AutofillOnboardingFlowViewModel.Factory,
    onboardingChecklistFlowViewModelFactory: OnboardingChecklistFlowViewModel.Factory
  ) {
    self.detailViewModelFactory = detailViewModelFactory
    self.homeViewModelFactory = homeViewModelFactory
    self.vaultListViewModelFactory = vaultListViewModelFactory
    self.addItemFlowViewModelFactory = addItemFlowViewModelFactory
    self.autofillOnboardingFlowViewModelFactory = autofillOnboardingFlowViewModelFactory
    self.onboardingChecklistFlowViewModelFactory = onboardingChecklistFlowViewModelFactory
    self.onboardingChecklistViewAction = onboardingChecklistViewAction

    self.accessControl = accessControl
    self.userSpacesService = userSpacesService
    self.activityReporter = activityReporter
    self.vaultItemsStore = vaultItemsStore
    self.vaultItemDatabase = vaultItemDatabase
    self.vaultItemsLimitService = vaultItemsLimitService
    self.deeplinkPublisher = deepLinkingService.vaultDeeplinkPublisher()
    self.deepLinkingService = deepLinkingService

    start(with: itemCategory, onboardingChecklistViewAction: onboardingChecklistViewAction)
    setupPublishers()
  }

  private func start(
    with itemCategory: ItemCategory?,
    onboardingChecklistViewAction: ((OnboardingChecklistFlowViewModel.Action) -> Void)?
  ) {
    switch (itemCategory, onboardingChecklistViewAction) {
    case (.none, .some(let handler)):
      start(with: handler)
    case (.some(let itemCategory), .none):
      start(with: itemCategory)
    default:
      assertionFailure(
        "VaultFlowViewModel should always be initialized with either a ItemCategory or a OnboardingChecklistViewAction handler"
      )
    }
  }

  private func start(with itemCategory: ItemCategory) {
    mode = .category(itemCategory)
    showCategoryDetail(itemCategory)
  }

  private func start(
    with onboardingChecklistViewAction: @escaping (OnboardingChecklistFlowViewModel.Action) -> Void
  ) {
    mode = .allItems(onboardingChecklistViewAction)
    showListView(action: onboardingChecklistViewAction)
  }

  private func setupPublishers() {
    actionPublisher
      .receive(on: RunLoop.main)
      .sink { [weak self] action in
        switch action {
        case .showAutofillDemo(let credential):
          self?.showAutofillDemo(for: credential)
        }
      }
      .store(in: &cancellables)

    if case let .category(category) = mode {
      vaultItemsStore
        .itemsPublisher(for: category)
        .receive(on: categoryCountQueue)
        .filter(by: userSpacesService.$configuration)
        .map { $0.count }
        .receive(on: DispatchQueue.main)
        .assign(to: &$categoryItemsCount)
    }
  }
}

extension VaultFlowViewModel {
  func handleHomeViewAction(_ action: VaultFlowViewModel.Action) {
    switch action {
    case .showAutofillDemo:
      showAutofillDemo()
    case .showAuthenticatorSunsetPage:
      showAuthenticatorSunsetPage()
    case .showChecklist:
      showChecklist()
    case let .didSelectItem(item, selectVaultItem, isEditing):
      showDetail(for: item, selectVaultItem: selectVaultItem, isEditing: isEditing)
    case let .addItem(displayMode):
      showAddItemMenuView(displayMode: displayMode)
    default:
      break
    }
  }

  func handleAutofillDemoDummyFieldsAction(_ action: AutoFillDemoDummyFields.Completion) {
    switch action {
    case .back:
      if Device.isIpadOrMac {
        autofillDemoDummyFieldsCredential = nil
      } else {
        steps.removeLast()
      }
    case .setupAutofill:
      showAutofillDemo()
    }
  }

  func showCategoryDetail(_ category: ItemCategory) {
    steps.removeAll()
    steps.append(.vaultList(category))
  }

  func showListView(action: @escaping (OnboardingChecklistFlowViewModel.Action) -> Void) {
    steps.removeAll()
    steps.append(.home(action))
  }

  func showDetail(
    for item: VaultItem,
    selectVaultItem: UserEvent.SelectVaultItem,
    isEditing: Bool = false,
    origin: ItemDetailOrigin = .unknown
  ) {
    if let secureItem = item as? SecureItem, secureItem.secured {
      accessControl
        .requestAccess()
        .sink { [weak self] success in
          if success {
            self?.showItemDetail(
              for: item,
              selectVaultItem: selectVaultItem,
              isEditing: isEditing,
              origin: origin
            )
          }
        }
        .store(in: &cancellables)
    } else {
      showItemDetail(
        for: item,
        selectVaultItem: selectVaultItem,
        isEditing: isEditing,
        origin: origin)
    }
  }

  private func showItemDetail(
    for item: VaultItem,
    selectVaultItem: UserEvent.SelectVaultItem,
    isEditing: Bool,
    origin: ItemDetailOrigin
  ) {
    activityReporter.report(selectVaultItem)
    steps.append(
      .vaultDetail(
        item,
        isEditing
          ? .editing(item) : .viewing(item, actionPublisher: actionPublisher, origin: origin)))
  }

  func showAutofillDemo(for credential: Credential) {
    showAutofillDemo(
      for: credential,
      modal: { self.autofillDemoDummyFieldsCredential = credential },
      push: { self.steps.append(.autofillDemoDummyFields(credential)) })
  }

  func showAutofillDemo() {
    showAutofillFlow = true
  }

  func showAuthenticatorSunsetPage() {
    steps.append(.authenticatorSunset)
  }

  func showChecklist() {
    showOnboardingChecklist = true
  }

  func openImportFlow() {
    let link = DeepLink.importMethod(
      ImportMethodDeeplink.import(ImportMethodDeeplink.Method.lastpass))
    deepLinkingService.handleLink(link)
  }
}

extension VaultFlowViewModel {
  func reportAddItemFlowDismissed() {
    let page = activeFilter.page
    activityReporter.reportPageShown(page)
  }
}

extension VaultFlowViewModel {
  func makeDetailViewModel() -> VaultDetailViewModel {
    detailViewModelFactory.make()
  }

  func makeHomeViewModel(
    onboardingChecklistViewAction: @escaping (OnboardingChecklistFlowViewModel.Action) -> Void
  ) -> HomeViewModel {
    homeViewModelFactory.make(
      onboardingAction: onboardingChecklistViewAction,
      action: { self.handleHomeViewAction($0) }
    )
  }

  func makeVaultListViewModel(category: ItemCategory) -> VaultListViewModel {
    vaultListViewModelFactory.make(
      activeFilter: category,
      onboardingAction: { [weak self] in self?.onboardingChecklistViewAction?($0) },
      action: { [weak self] in self?.handleHomeViewAction($0) },
      completion: { [weak self] completion in
        switch completion {
        case .addItem(let mode):
          self?.showAddItemMenuView(displayMode: mode)
        case let .enterDetail(item, selectVaultItem, isEditing):
          self?.showDetail(for: item, selectVaultItem: selectVaultItem, isEditing: isEditing)
        }
      }
    )
  }
}
