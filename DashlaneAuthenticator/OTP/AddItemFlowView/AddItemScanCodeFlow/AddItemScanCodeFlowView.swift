import AuthenticatorKit
import LoginKit
import SwiftUI
import UIDelight

struct AddItemScanCodeFlowView: View {
  @StateObject
  var viewModel: AddItemScanCodeFlowViewModel

  @Environment(\.dismiss) private var dismiss

  init(viewModel: @autoclosure @escaping () -> AddItemScanCodeFlowViewModel) {
    self._viewModel = .init(wrappedValue: viewModel())
  }

  var body: some View {
    navigationView
      .onReceive(viewModel.dismissPublisher) {
        dismiss()
      }
  }

  var navigationView: some View {
    StepBasedContentNavigationView(steps: $viewModel.steps) { step in
      switch step {
      case .scanCode:
        ScanQRCodeView(model: viewModel.makeScanQRCodeViewModel()) {
          self.viewModel.startManuallyChooseWebsite()
        }
      case .enterCodeManually:
        AddItemManuallyFlowView(viewModel: viewModel.makeAddItemManuallyFlowViewModel())
      case let .credentialsMatchingWebsite(otpInfo, matchingCredentials, provider):
        MatchingCredentialsListView(
          viewModel: viewModel.makeMatchingCredentialListViewModel(
            otpInfo: otpInfo, matchingCredentials: matchingCredentials, provider: provider))
      case let .failedToAddItem(website):
        failedToAddItemErrorView(website: website)
      case let .preview(model, completion):
        AddItemPreviewView(
          model: model, isFirstToken: viewModel.isFirstToken, completion: completion)
      case let .dashlane2FAMessage(otpInfo):
        Dashlane2FAMessageView {
          viewModel.complete(otpInfo, mode: .qrCode)
        }
      }
    }
  }

  func failedToAddItemErrorView(website: String) -> some View {
    FeedbackView(
      title: L10n.Localizable.errorAdd2FaTitle(website),
      message: L10n.Localizable.errorAdd2FaMessage(
        L10n.Localizable.errorAdd2FaMessageModeScan,
        L10n.Localizable.errorAdd2FaMessageModeScanTryManual),
      primaryButton: (
        L10n.Localizable.errorAdd2FaTryAgain,
        {
          viewModel.resetFlow()
        }
      ),
      secondaryButton: (
        L10n.Localizable.addOtpFlowEnterManualCta,
        {
          viewModel.startManuallyChooseWebsite()
        }
      ))
  }
}

struct AddItemScanCodeFlowView_Previews: PreviewProvider {
  static var previews: some View {
    AddItemScanCodeFlowView(
      viewModel: AuthenticatorMockContainer().makeAddItemScanCodeFlowViewModel(
        mode: .standalone, isFirstToken: true,
        didCreate: { _, _ in

        }))
  }
}
