import CoreFeature
import CoreLocalization
import CorePersonalData
import DesignSystem
import SwiftTreats
import SwiftUI
import UIDelight
import UIKit
import VaultKit

struct SecureNotesDetailToolbar: View {

  @Environment(\.dismiss)
  private var dismissAction

  @Environment(\.isPresented)
  private var isPresented

  @Environment(\.navigator)
  private var navigator

  @Environment(\.detailContainerViewSpecificDismiss)
  private var dismissView

  @StateObject
  var model: SecureNotesDetailToolbarModel

  let toolbarHeight: CGFloat

  var isEditingContent: FocusState<Bool>.Binding

  @Binding
  var showDocumentStorage: Bool

  @Binding
  var showColorPicker: Bool

  @Binding
  var showSpaceSelector: Bool

  @Binding
  var showPreview: Bool

  @State
  private var showLimitedRightsAlert: Bool = false

  @State
  private var showToolsActionSheet: Bool = false

  @State
  private var showSharingDisabledAlert: Bool = false

  @State
  private var deleteRequest: DeleteVaultItemRequest = .init()

  @Environment(\.toast)
  private var toast

  @FeatureState(.secureNoteMarkdownEnabled)
  private var secureNoteMarkdownEnabled: Bool

  init(
    model: @escaping @autoclosure () -> SecureNotesDetailToolbarModel,
    toolbarHeight: CGFloat,
    isEditingContent: FocusState<Bool>.Binding,
    showDocumentStorage: Binding<Bool>,
    showColorPicker: Binding<Bool>,
    showSpaceSelector: Binding<Bool>,
    showPreview: Binding<Bool>
  ) {
    self._model = .init(wrappedValue: model())
    self.toolbarHeight = toolbarHeight
    self.isEditingContent = isEditingContent
    self._showDocumentStorage = showDocumentStorage
    self._showColorPicker = showColorPicker
    self._showSpaceSelector = showSpaceSelector
    self._showPreview = showPreview
  }

  var body: some View {
    if !isEditingContent.wrappedValue {
      VStack(spacing: 0) {
        Divider()
          .foregroundColor(.ds.border.neutral.quiet.idle)
        HStack {
          if !model.mode.isAdding {
            Spacer()
              .alert(item: $model.alert) { alert in
                switch alert {
                case .errorWhileDeletingFiles:
                  return Alert(
                    title: Text(CoreLocalization.L10n.Core.kwExtSomethingWentWrong),
                    dismissButton: Alert.Button.default(Text(CoreLocalization.L10n.Core.kwButtonOk))
                  )
                }
              }
            deleteButton
          }
          Spacer()
          if !model.mode.isAdding && !model.item.hasAttachments
            && model.item.metadata.sharingPermission != .limited
          {
            shareButton
            Spacer()
          }
          if model.shouldShowLockButton {
            lockButton
            Spacer()
          }
          if !model.mode.isAdding && !model.item.isShared {
            documentStorageButton
            Spacer()
          }
          toolsButton
          Spacer()

          if model.availableUserSpaces.count > 1 {
            spaceButton
            Spacer()
          }
          if secureNoteMarkdownEnabled {
            previewButton
            Spacer()
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: toolbarHeight)
      }
      .background(Color.ds.container.agnostic.neutral.quiet.edgesIgnoringSafeArea(.bottom))
    }
  }

  private var deleteButton: some View {
    Button(
      action: {
        Task {
          deleteRequest.itemDeleteBehavior = try await model.itemDeleteBehavior()
          deleteRequest.isPresented = true
        }
      },
      label: {
        Image.ds.action.delete.outlined
          .foregroundColor(.ds.text.danger.standard)
          .aspectRatio(contentMode: .fit)
      }
    )
    .deleteItemAlert(request: $deleteRequest, deleteAction: delete)
    .accessibilityLabel(CoreLocalization.L10n.Core.kwDelete)
  }

  private var lockMessage: String {
    model.item.secured
      ? L10n.Localizable.kwPadNotesLockedNotice : L10n.Localizable.kwPadNotesUnlockedNotice
  }

  private var lockIcon: SwiftUI.Image {
    model.item.secured ? .ds.lock.outlined : .ds.unlock.outlined
  }

  private var lockButton: some View {
    Button(
      action: {
        guard !model.hasLimitedRights else {
          showLimitedRightsAlert = true
          return
        }
        model.item.secured.toggle()
        model.saveIfViewing()
        toast(lockMessage, image: .ds.secureLock(locked: model.item.secured))
        UISelectionFeedbackGenerator().selectionChanged()
      },
      label: {
        lockIcon
          .foregroundColor(.ds.text.neutral.quiet)
      }
    )
    .frame(minWidth: 18)
    .accessibilityLabel(
      model.item.secured
        ? L10n.Localizable.accessibilitySecureNoteUnlock
        : L10n.Localizable.accessibilitySecureNoteLock
    )
    .alert(
      model.item.limitedRightsAlertTitle,
      isPresented: $showLimitedRightsAlert,
      actions: {
        Button(CoreLocalization.L10n.Core.kwButtonOk) {}
      }
    )
  }

  @ViewBuilder
  private var shareButton: some View {
    ShareButton(model: model.shareButtonViewModelFactory.make(items: [model.item])) {
      Image.ds.action.share.outlined
        .foregroundColor(.ds.text.neutral.quiet)
    }
  }

  private var documentStorageButton: some View {
    Button(
      action: {
        if !model.mode.isAdding {
          showDocumentStorage = true
        }
      },
      label: {
        Image.ds.attachment.outlined
          .foregroundColor(.ds.text.neutral.quiet)
      }
    )
    .accessibilityLabel(Text(CoreLocalization.L10n.Core.kwAttachementsTitle))
  }

  private var toolsButton: some View {
    Button(
      action: { showToolsActionSheet.toggle() },
      label: {
        Image.ds.tools.outlined
          .foregroundColor(.ds.text.neutral.quiet)
      }
    )
    .actionSheet(isPresented: $showToolsActionSheet) {
      ActionSheet(
        title: Text(CoreLocalization.L10n.Core.kwSecureNoteIOS),
        message: nil,
        buttons: [
          .cancel(),
          .default(
            Text(CoreLocalization.L10n.Core.KWSecureNoteIOS.colorTitle),
            action: { showColorPicker = true }),
        ]
      )
    }
    .accessibilityLabel(Text(L10n.Localizable.customizeSecureNote))
  }

  private var spaceButton: some View {
    Button(
      action: { showSpaceSelector = true },
      label: {
        UserSpaceIcon(space: model.selectedUserSpace, size: .normal)
          .equatable()
      }
    )
    .disabled(model.isUserSpaceForced)
  }

  private var previewButton: some View {
    Button(
      action: {
        withAnimation {
          showPreview.toggle()
        }
      },
      label: {
        if !showPreview {
          Image.ds.action.reveal.outlined
            .foregroundColor(.ds.text.neutral.quiet)
        } else {
          Image.ds.action.hide.outlined
            .foregroundColor(.ds.text.neutral.quiet)
        }

      })
  }
}

extension SecureNotesDetailToolbar {

  fileprivate func delete() {
    Task {
      await self.model.delete()
      await MainActor.run {
        self.dismiss()
      }
    }
  }

  fileprivate func dismiss() {
    if let dismissView {
      dismissView()
    } else if let navigator = navigator(), navigator.canDismiss == true {
      navigator.dismiss()
    } else {
      dismissAction()
    }
  }
}

extension SwiftUI.Image.ds {
  fileprivate static func secureLock(locked: Bool) -> SwiftUI.Image {
    locked ? .ds.lock.outlined : .ds.unlock.outlined
  }
}
