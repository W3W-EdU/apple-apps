import Combine
import CoreFeature
import CoreLocalization
import CorePasswords
import CorePersonalData
import CoreSettings
import CoreUserTracking
import DashTypes
import DesignSystem
import IconLibrary
import Logger
import SwiftUI
import UIComponents
import UIDelight
import VaultKit

public struct AddCredentialView: View {

  @StateObject
  var model: AddCredentialViewModel

  @FocusState private var isWebsiteFieldFocused

  @Environment(\.dismiss)
  private var dismiss

  @FeatureState(.prideColors)
  private var isPrideColorsEnabled: Bool

  public init(model: @autoclosure @escaping () -> AddCredentialViewModel) {
    _model = .init(wrappedValue: model())
  }

  public var body: some View {
    StepBasedContentNavigationView(steps: $model.steps) { step in
      switch step {
      case .root:
        list
          .navigationTitle(L10n.Core.kwadddatakwAuthentifiantIOS)
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              NavigationBarButton(L10n.Core.kwSave) {
                Task {
                  await save()
                }
              }
            }
          }
          .onAppear {
            isWebsiteFieldFocused = true
          }
      case .passwordGenerator:
        PasswordGeneratorView(viewModel: model.makePasswordGeneratorViewModel())
      case .confirmation:
        AddCredentialConfirmationView(
          item: model.item,
          didFinish: model.didFinish
        )
      }

    }
    .reportPageAppearance(.autofillExplorePasswordsCreate)
  }

  @ViewBuilder
  var list: some View {
    List {
      content
        .fieldAppearance(.grouped)
        .environment(\.detailMode, .adding())
    }
    .detailListStyle()
  }

  @ViewBuilder
  var content: some View {
    Group {
      Section(L10n.Core.addCredentialWebsiteSection) {
        website
      }
      if model.hasSpaceSelection {
        Section(L10n.Core.addCredentialWebsiteSpace) {
          spaceSelector
        }
      }
      Section(L10n.Core.addCredentialWebsiteLogin) {
        email
        password
      }
    }
  }

  @ViewBuilder
  var website: some View {
    DS.TextField(L10n.Core.KWAuthentifiantIOS.urlStringForUI, text: $model.item.editableURL)
      .focused($isWebsiteFieldFocused)
  }

  @ViewBuilder
  var spaceSelector: some View {
    HStack {
      UserSpaceIcon(space: model.selectedSpace, size: .normal)
        .equatable()
        .padding(4)
      Text(model.selectedSpace.teamName)
        .foregroundColor(.ds.text.brand.standard)
        .font(.subheadline.weight(.regular))

      if model.spaceIsSwitchable {
        Spacer()

        Menu(
          content: {
            ForEach(model.availableUserSpaces) { space in
              Button {
                model.selectedSpace = space
              } label: {
                Text(space.teamName)
              }
              .eraseToAnyView()
            }
          },
          label: {
            Image.ds.action.more.outlined
          })
      }
    }
  }

  @ViewBuilder
  var email: some View {
    DS.TextField(
      model.loginIsMail ? L10n.Core.KWAuthentifiantIOS.email : L10n.Core.KWAuthentifiantIOS.login,
      placeholder: "\(L10n.Core.KWAuthentifiantIOS.email) / \(L10n.Core.KWAuthentifiantIOS.login)",
      text: $model.login,
      actions: {
        if !model.emails.isEmpty {
          DS.FieldAction.Menu(
            L10n.Core.detailItemViewAccessibilitySelectEmail,
            image: .ds.action.more.outlined
          ) {
            ForEach(model.emails) { email in
              Button(email.value) {
                model.login = email.value
              }
            }
          }
        }
      }
    )
    .textContentType(.emailAddress)
  }

  @ViewBuilder
  var password: some View {
    VStack(spacing: 4) {
      DS.TextField(
        L10n.Core.KWAuthentifiantIOS.password, text: $model.item.password,
        actions: {
          #warning("Lacks of proper label (used for accessibility purposes!)")
          DS.FieldAction.Button(
            "",
            image: .ds.action.refresh.outlined,
            action: model.refreshPassword
          )
        }
      )
      .secureInput()
      .textFieldRevealSecureValue(model.shouldReveal)
      .textColorHighlightingMode(.password)

      passwordAccessory

      Button(L10n.Core.addCredentialGeneratorCTA) {
        model.steps.append(.passwordGenerator)
      }
      .buttonStyle(.designSystem(.titleOnly))
      .style(mood: .brand, intensity: .supershy)
      .padding(.top)
    }
  }

  @ViewBuilder
  private var passwordAccessory: some View {
    TextInputPasswordStrengthFeedback(
      strength: model.passwordStrength, colorful: isPrideColorsEnabled
    )
    .animation(.default, value: model.passwordStrength)
  }

  private func save() async {
    model.prepareForSaving()
    await model.save()
    model.steps.append(.confirmation)
  }
}

struct AddCredentialView_Previews: PreviewProvider {
  static var viewModel: AddCredentialViewModel {
    let email1 = Email(value: "_", name: "Test 1")
    let email2 = Email(value: "_", name: "Test 2")

    return AddCredentialViewModel.mock(existingItems: [email1, email2], hasBusinessTeam: true)
  }

  static var previews: some View {
    AddCredentialView(model: Self.viewModel)
  }
}
