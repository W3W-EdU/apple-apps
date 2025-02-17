import DesignSystem
import SwiftUI

struct ChangeContactEmailView: View {

  @StateObject
  var model: ChangeContactEmailViewModel

  @Environment(\.dismiss)
  var dismiss

  @Environment(\.toast)
  var toast

  @State
  var newContactEmail: String = ""

  init(model: @autoclosure @escaping () -> ChangeContactEmailViewModel) {
    _model = .init(wrappedValue: model())
  }

  var body: some View {
    NavigationView {
      List {
        Section(
          footer: Text(L10n.Localizable.changeContactEmailFooter)
        ) {
          DS.TextField(
            L10n.Localizable.changeContactEmailCurrentContactEmail, text: $model.currentContactEmail
          )
          .editionDisabled()
          .fieldAppearance(.grouped)
          DS.TextField(L10n.Localizable.changeContactEmailNewContactEmail, text: $newContactEmail)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .fieldAppearance(.grouped)
            .onSubmit {
              model.requestEmailChange(to: newContactEmail, with: toast)
            }
        }
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(L10n.Localizable.changeContactEmailCancel) {
            dismiss()
          }
          .foregroundStyle(Color.ds.text.brand.standard)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(L10n.Localizable.changeContactEmailSave) {
            model.requestEmailChange(to: newContactEmail, with: toast)
          }
          .foregroundStyle(Color.ds.text.brand.standard)
          .disabled(newContactEmail.isEmpty)
        }
      }
    }
    .onReceive(model.dismissActionPublisher) { _ in
      dismiss()
    }
  }
}

#Preview {
  ChangeContactEmailView(model: .mock)
}
