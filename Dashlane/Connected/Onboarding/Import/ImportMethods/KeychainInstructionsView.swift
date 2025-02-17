import DesignSystem
import Foundation
import SwiftUI
import UIComponents
import UIDelight

struct KeychainInstructionsView: View {

  enum Completion {
    case goToSettings
    case cancel
  }

  let completion: ((Completion) -> Void)

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 0) {
        VStack(alignment: .leading, spacing: 0) {
          Text(L10n.Localizable.keychainInstructionsTitle)
            .fixedSize(horizontal: false, vertical: true)
            .font(DashlaneFont.custom(26, .bold).font)
            .padding(.top, 80)

          HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.ds.border.neutral.standard.active)
            Text(L10n.Localizable.keychainInstructionsWebsitesAndAppPasswords)
            Spacer()
            Image(systemName: "xmark.circle.fill").foregroundColor(
              .ds.border.neutral.standard.active)
          }
          .padding(10)
          .background(Color.ds.container.expressive.neutral.quiet.idle)
          .cornerRadius(10)
          .padding(.top, 57)

          Text(L10n.Localizable.keychainInstructionsHowToFindSearchBar)
            .font(.footnote)
            .foregroundColor(.ds.text.neutral.quiet)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 8)
            .padding(.top, 13)
        }
        .fiberAccessibilityElement(children: .combine)

        Text(L10n.Localizable.keychainInstructionsChoosePasswordToCopy)
          .font(.body)
          .bold()
          .fixedSize(horizontal: false, vertical: false)
          .padding(.top, 37)

        Spacer()
        Button(L10n.Localizable.keychainInstructionsCTA) {
          self.completion(.goToSettings)
        }
        .buttonStyle(.designSystem(.titleOnly))
        .padding(.bottom, 30)
      }
    }
    .frame(maxWidth: 400)
    .padding(.horizontal, 16)
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        NavigationBarButton(L10n.Localizable.keychainInstructionsCancel) {
          completion(.cancel)
        }
      }
    }
  }
}

struct KeychainInstructionsView_Previews: PreviewProvider {
  static var previews: some View {
    MultiContextPreview {
      KeychainInstructionsView { result in
        switch result {
        case .cancel:
          print("Canceled")
        case .goToSettings:
          print("Go to Settings")
        }
      }
    }
  }
}
