import AutofillKit
import Combine
import CoreSettings
import CoreUserTracking
import Foundation
import LoginKit

extension ActivityReporterProtocol {

  func reportUserSettings(
    _ userSettings: UserSettings,
    autofillService: AutofillService,
    resetMPService: ResetMasterPasswordService,
    lock: LockService
  ) {

    let lockConfigurator = lock.secureLockConfigurator
    let clipboardExpirationActivated =
      userSettings[.clipboardExpirationDelay] as TimeInterval? != nil

    let settings = UserEvent.UserSettings(
      hasAuthenticationWithBiometrics: lockConfigurator.isBiometricActivated,
      hasAuthenticationWithPin: lockConfigurator.isPincodeActivated,
      hasAutofillActivated: autofillService.activationStatus.isEnabled,
      hasClearClipboard: clipboardExpirationActivated,
      hasLockOnExit: lock.locker.screenLocker?.lockOnExitState != .disabled,
      hasMasterPasswordBiometricReset: resetMPService.isActive,
      lockAutoTimeout: lock.locker.screenLocker?.lockDelay.map(Int.init))
    report(settings)
  }

}
