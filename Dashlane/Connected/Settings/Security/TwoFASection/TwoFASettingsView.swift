import CoreLocalization
import CoreNetworking
import CoreSession
import CoreSync
import DashTypes
import DesignSystem
import LoginKit
import SwiftTreats
import SwiftUI
import TOTPGenerator
import UIComponents
import UIDelight

struct TwoFASettingsView: View {

  enum NextPossibleActionSheet: Identifiable {
    var id: String {
      switch self {
      case .deactivation:
        return "deactivation"
      case .twoFAEnforced:
        return "twoFAEnforced"
      }
    }
    case deactivation(Dashlane2FAType)
    case twoFAEnforced
  }

  @StateObject
  var model: TwoFASettingsViewModel

  @State
  var appStoreViewer: AppStoreProductViewer?

  @Environment(\.dismiss)
  private var dismiss

  var body: some View {
    VStack {
      switch model.status {
      case .loaded:
        DS.Toggle(L10n.Localizable.twofaSettingsTitle, isOn: $model.isTFAEnabled)
          .onTapGesture {
            model.update()
          }
      case .noInternet:
        TwoFASettingsStatus {
          Image.ds.noNetwork.outlined
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(.ds.text.danger.quiet)
        }
      case .error:
        TwoFASettingsStatus {
          Image.ds.feedback.fail.outlined
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(.ds.text.danger.quiet)
        }
      case .loading:
        TwoFASettingsStatus {
          ProgressView()
        }
      }
    }
    .fullScreenCover(
      item: $model.sheet,
      onDismiss: {
        Task {
          await model.updateState()
        }
        openAppStoreViewIfPossible()
      },
      content: { item in
        switch item {
        case let .deactivation(currentOtp):
          TwoFADeactivationView(model: model.makeTwoFADeactivationViewModel(currentOtp: currentOtp))
        case .twoFAEnforced:
          TwoFactorEnforcementView(model: model.makeTwoFactorEnforcementViewModel())
        }
      }
    )
    .alert(
      L10n.Localizable.twofaDeactivationAlertTitle,
      isPresented: $model.showDeactivationAlert,
      actions: {
        Button(CoreLocalization.L10n.Core.cancel) {
          Task {
            await model.fetch()
          }
        }

        Button(L10n.Localizable.twofaDeactivationAlertCta) {
          guard let currentOTP = model.currentOTP else { return }
          model.sheet = .deactivation(currentOTP)
        }
      },
      message: {
        Text(L10n.Localizable.twofaDeactivationAlertMessage)
      }
    )
  }

  var notPairedView: some View {
    NavigationView {
      FeedbackView(
        title: L10n.Localizable.twofaSetupUnpairedTitle(Device.currentBiometryDisplayableName),
        message: L10n.Localizable.twofaSetupUnpairedMessage1(Device.currentBiometryDisplayableName)
          + "\n\n" + L10n.Localizable.twofaSetupUnpairedMessage2,
        kind: .twoFA,
        helpCTA: (
          L10n.Localizable.twofaSetupUnpairedHelpCta, DashlaneURLFactory.aboutAuthenticator
        ),
        primaryButton: (
          L10n.Localizable.twofaSetupUnpairedCta,
          {
            model.sheet = nil
          }
        )
      )
      .toolbar(.visible, for: .navigationBar)
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(
            action: {
              model.sheet = nil
            },
            label: {
              Text(CoreLocalization.L10n.Core.cancel)
                .foregroundColor(.ds.text.neutral.standard)
            })
        }
      })
    }
  }

  func openAppStoreViewIfPossible() {
    DispatchQueue.main.async {
      appStoreViewer?.openAppStorePage(dismissed: {})
      appStoreViewer = nil
    }
  }
}

private struct TwoFASettingsStatus<Content: View>: View {
  let content: () -> Content

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  var body: some View {
    HStack {
      Text(L10n.Localizable.twofaSettingsTitle)
        .foregroundColor(.ds.text.neutral.standard)
      Spacer()
      content()
    }
  }
}

struct TwoFASettingsView_Previews: PreviewProvider {
  static var previews: some View {
    TwoFASettingsView(model: .mock)
  }
}
