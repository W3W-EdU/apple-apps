import CoreLocalization
import DesignSystem
import SwiftUI
import VaultKit

struct ActionableVaultItemRow: View {
  @Environment(\.toast) private var toast
  @Environment(\.highlightedValue) private var highlightedValue

  @State var showLimitedRightsAlert: Bool = false

  let model: ActionableVaultItemRowViewModel
  let select: (() -> Void)

  var body: some View {
    DS.ListItem {
      let userSpace = model.userSpacesService.configuration
        .displayedUserSpace(for: model.item)
      VaultItemRow(
        item: model.item,
        userSpace: userSpace,
        vaultIconViewModelFactory: model.vaultItemIconViewModelFactory
      )
      .onTapWithFeedback {
        select()
      }
    } actions: {
      quickActions
    }
    .tint(Color.ds.text.brand.standard)
  }

  @ViewBuilder
  @MainActor
  private var quickActions: some View {
    QuickActionsMenuView(
      model: model.quickActionsMenuViewModelFactory.make(
        item: model.item,
        origin: model.origin,
        isSuggestedItem: model.isSuggested
      )
    )
    copyPasswordAction
      .alert(
        model.item.limitedRightsAlertTitle,
        isPresented: $showLimitedRightsAlert,
        actions: {
          Button(CoreLocalization.L10n.Core.kwButtonOk) {}
        }
      )
  }

  @ViewBuilder
  private var copyPasswordAction: some View {
    if case let .credential(credential) = model.item.enumerated, !credential.password.isEmpty {
      FieldAction.CopyContent {
        Task {
          await performCopyPassword(credential.password)
        }
      }
    }
  }

  @MainActor
  private func performCopyPassword(_ password: String) async {
    guard
      let result = await model.copy(
        password,
        fieldType: .password,
        highlightedString: highlightedValue
      )
    else { return }

    switch result {
    case .success:
      UINotificationFeedbackGenerator().notificationOccurred(.success)
      toast(L10n.Localizable.pasteboardCopyPassword, image: .ds.action.copy.outlined)
    case .limitedRights:
      showLimitedRightsAlert = true
    case .authenticationDenied:
      return
    }
  }
}

#Preview {
  List {
    ActionableVaultItemRow(
      model: .mock(item: PersonalDataMock.Credentials.github),
      select: {}
    )
  }
  .listAppearance(.plain)
}
