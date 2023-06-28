import SwiftUI
import DesignSystem

struct MyView: View {
    @State private var firstname = ""

    var body: some View {
        DS.TextField(
            "Firstname",
            placeholder: "Enter your firstname",
            text: $firstname,
            actions: {
                TextFieldAction.ClearContent(text: $firstname)
                TextFieldAction.Menu(
                    "More", image: .ds.action.more.outlined
                ) {
                    Button("Action One") {}
                    Button("Action Two") {}
                }
            }
        )
    }
}
