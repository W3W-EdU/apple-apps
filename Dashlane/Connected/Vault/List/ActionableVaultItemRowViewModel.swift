import CorePersonalData
import CorePremium
import CoreSharing
import CoreUserTracking
import Foundation
import VaultKit

struct ActionableVaultItemRowViewModel: SessionServicesInjecting {

  public enum Origin {
    case vault
    case home
    case search
  }

  let item: VaultItem

  let quickActionsMenuViewModelFactory: QuickActionsMenuViewModel.Factory
  let vaultItemIconViewModelFactory: VaultItemIconViewModel.Factory

  let origin: Origin
  let isSuggested: Bool

  private let itemPasteboard: ItemPasteboardProtocol
  private let vaultItemDatabase: VaultItemDatabaseProtocol
  private let sharingPermissionProvider: SharedVaultHandling
  private let activityReporter: ActivityReporterProtocol
  let userSpacesService: UserSpacesService

  public init(
    item: VaultItem,
    isSuggested: Bool,
    origin: ActionableVaultItemRowViewModel.Origin,
    quickActionsMenuViewModelFactory: QuickActionsMenuViewModel.Factory,
    vaultItemIconViewModelFactory: VaultItemIconViewModel.Factory,
    accessControl: AccessControlProtocol,
    pasteboardService: PasteboardServiceProtocol,
    vaultItemDatabase: VaultItemDatabaseProtocol,
    sharingPermissionProvider: SharedVaultHandling,
    activityReporter: ActivityReporterProtocol,
    userSpacesService: UserSpacesService
  ) {
    self.item = item
    self.quickActionsMenuViewModelFactory = quickActionsMenuViewModelFactory
    self.vaultItemIconViewModelFactory = vaultItemIconViewModelFactory
    self.itemPasteboard = ItemPasteboard(
      accessControl: accessControl, pasteboardService: pasteboardService)
    self.vaultItemDatabase = vaultItemDatabase
    self.sharingPermissionProvider = sharingPermissionProvider
    self.activityReporter = activityReporter
    self.userSpacesService = userSpacesService
    self.origin = origin
    self.isSuggested = isSuggested
  }
}

extension ActionableVaultItemRowViewModel {
  func deleteBehaviour() async throws -> ItemDeleteBehaviour {
    try await sharingPermissionProvider.deleteBehaviour(for: item)
  }

  func delete() {
    vaultItemDatabase.dispatchDelete(item)
  }
}

extension ActionableVaultItemRowViewModel {

  public enum CopyResult {
    case success(fieldType: Definition.Field)
    case limitedRights
    case authenticationDenied
  }

  func copy(_ valueToCopy: String, fieldType: Definition.Field, highlightedString: String?) async
    -> CopyResult?
  {
    guard let item = item as? CopiablePersonalData & VaultItem else {
      return nil
    }

    guard sharingPermissionProvider.canCopyProperties(in: item) else {
      return .limitedRights
    }

    var origin: Set<LastUseUpdateOrigin> = [.default]
    if highlightedString != nil {
      origin.insert(.search)
    }

    vaultItemDatabase.updateLastUseDate(of: [item], origin: origin)

    sendCopyUsageLog(fieldType: fieldType)
    let isSuccess =
      await itemPasteboard
      .copy(item, valueToCopy: valueToCopy).values.first { _ in true }

    return isSuccess == true ? .success(fieldType: fieldType) : .authenticationDenied
  }

  private func sendCopyUsageLog(fieldType: Definition.Field) {
    let isProtected: Bool
    if let secureItem = item as? SecureItem {
      isProtected = secureItem.secured
    } else {
      isProtected = false
    }
    let item = item
    let highlight = origin.definitionHighlight(isSuggested)
    activityReporter.report(
      UserEvent.CopyVaultItemField(
        field: fieldType,
        highlight: highlight,
        index: Double(-1),
        isProtected: isProtected,
        itemId: item.userTrackingLogID,
        itemType: item.vaultItemType
      )
    )
    activityReporter.report(
      AnonymousEvent.CopyVaultItemField(
        domain: item.hashedDomainForLogs(),
        field: fieldType,
        itemType: item.vaultItemType
      )
    )
  }
}

extension ActionableVaultItemRowViewModel.Origin {
  var subAction: String? {
    switch self {
    case .vault:
      return "itemsList"
    case .home:
      return "suggestedList"
    case .search:
      return "search"
    }
  }

  var highlight: Definition.Highlight {
    switch self {
    case .home:
      return .suggested
    case .search:
      return .searchResult
    default:
      return .none
    }
  }

  public func definitionHighlight(_ isSuggested: Bool) -> Definition.Highlight {
    guard !isSuggested else {
      return .suggested
    }
    switch self {
    case .search:
      return .searchResult
    default:
      return .none
    }
  }
}

extension ActionableVaultItemRowViewModel {
  static func mock(
    item: VaultItem,
    isSuggested: Bool = false
  ) -> ActionableVaultItemRowViewModel {
    .init(
      item: item,
      isSuggested: isSuggested,
      origin: .vault,
      quickActionsMenuViewModelFactory: .init { _, _, _ in .mock(item: item) },
      vaultItemIconViewModelFactory: .init { item in .mock(item: item) },
      accessControl: FakeAccessControl(accept: true),
      pasteboardService: .mock(),
      vaultItemDatabase: MockVaultKitServicesContainer().vaultItemDatabase,
      sharingPermissionProvider: SharedVaultHandlerMock(),
      activityReporter: .mock,
      userSpacesService: .mock()
    )
  }
}
