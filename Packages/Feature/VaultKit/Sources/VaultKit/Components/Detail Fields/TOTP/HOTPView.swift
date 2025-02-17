import DesignSystem
import Foundation
import SwiftUI
import TOTPGenerator
import UIComponents

public struct HOTPView: View {
  let model: OTPConfiguration

  @Binding
  var code: String

  @Binding
  var counter: UInt64

  @Environment(\.detailMode)
  var detailMode

  let didChange: () -> Void
  let initialCounter: UInt64

  public init(
    model: OTPConfiguration,
    code: Binding<String>,
    initialCounter: UInt64,
    counter: Binding<UInt64>,
    didChange: @escaping () -> Void
  ) {
    self.model = model
    self._code = code
    self._counter = counter
    self.didChange = didChange
    self.initialCounter = initialCounter
  }

  public var body: some View {
    regenerateButton
      .onAppear {
        if !detailMode.isEditing {
          counter = initialCounter
          generateCode()
        }
      }
  }

  var regenerateButton: some View {
    Button(
      action: {
        increaseCode()
      },
      label: {
        Image(systemName: "arrow.clockwise")
          .foregroundColor(.ds.text.brand.quiet)
      }
    )
    .buttonStyle(BorderlessButtonStyle())
  }

  private func generateCode() {
    self.code = TOTPGenerator.generate(
      with: model.type, for: Date(), digits: model.digits, algorithm: model.algorithm,
      secret: model.secret, currentCounter: counter)
  }

  private func increaseCode() {
    counter += 1
    generateCode()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: didChange)
  }

}
