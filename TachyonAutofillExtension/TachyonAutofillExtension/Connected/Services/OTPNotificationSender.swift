import CorePersonalData
import CoreSettings
import Foundation
import TOTPGenerator
import VaultKit

public struct OTPNotificationSender {
  let userSettings: UserSettings
  let localNotificationService: LocalNotificationService

  init(userSettings: UserSettings, localNotificationService: LocalNotificationService) {
    self.userSettings = userSettings
    self.localNotificationService = localNotificationService
  }

  func send(for credential: Credential) {
    if let otpURL = credential.otpURL, let otpInfo = try? OTPConfiguration(otpURL: otpURL) {

      let code = TOTPGenerator.generate(
        with: otpInfo.type,
        for: Date(),
        digits: otpInfo.digits,
        algorithm: otpInfo.algorithm,
        secret: otpInfo.secret)
      let hasClipboardOverride: Bool? = userSettings[.clipboardOverrideEnabled]

      if hasClipboardOverride == true {
        PasteboardService(userSettings: userSettings).set(code)
      }

      let otpNotification = OTPLocalNotification(
        pin: code, itemId: credential.id.rawValue,
        hasClipboardOverride: hasClipboardOverride ?? false,
        domain: credential.url?.displayDomain)
      localNotificationService.send(otpNotification)
    }
  }
}
