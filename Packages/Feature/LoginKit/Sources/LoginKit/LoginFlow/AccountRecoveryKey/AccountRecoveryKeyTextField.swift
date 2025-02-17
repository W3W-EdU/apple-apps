import CoreLocalization
import DesignSystem
import Foundation
import SwiftUI

public struct AccountRecoveryKeyTextField: View {
  @Binding
  var recoveryKey: String

  @Binding
  var showNoMatchError: Bool

  public init(recoveryKey: Binding<String>, showNoMatchError: Binding<Bool>) {
    self._recoveryKey = recoveryKey
    self._showNoMatchError = showNoMatchError
  }

  var formattedRecoveryKey: Binding<String> {
    Binding<String>(
      get: {
        String(
          recoveryKey.uppercased().removeWhitespacesCharacters().inserting(separator: "-", every: 4)
            .prefix(34))
      },
      set: {
        recoveryKey = $0.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
          .uppercased()
      }
    )
  }

  public var body: some View {
    DS.TextField(
      L10n.Core.recoveryKeySettingsLabel, text: formattedRecoveryKey,
      feedback: {
        if showNoMatchError {
          Text(L10n.Core.recoveryKeyActivationConfirmationError)
            .foregroundColor(.ds.text.danger.quiet)
            .font(.callout)
        }
      }
    )
    .onChange(of: recoveryKey) { newValue in
      recoveryKey = newValue.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        .uppercased()
    }
    .style(showNoMatchError ? .error : nil)
  }
}

extension String {
  fileprivate func inserting(separator: String, every groupLength: Int) -> String {
    enumerated().reduce("") {
      $0
        + ((($1.offset + 1) % groupLength == 0)
          ? String($1.element) + separator : String($1.element))
    }
  }
}
