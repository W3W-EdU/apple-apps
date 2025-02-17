import CoreKeychain
import CoreSession
import CoreUserTracking
import Foundation

extension LocalLoginFlowViewModel {
  internal func makeLocalLoginUnlockViewModel(
    secureLockMode: SecureLockMode,
    handler: UnlockSessionHandler,
    unlockType: UnlockType
  ) -> LocalLoginUnlockViewModel {
    localLoginUnlockViewModelFactory.make(
      login: localLoginHandler.login,
      accountType: localLoginHandler.accountType,
      unlockType: unlockType,
      secureLockMode: secureLockMode,
      unlocker: handler,
      context: LoginUnlockContext(
        verificationMode: verificationMode,
        isBackupCode: isBackupCode,
        origin: .login,
        localLoginContext: context),
      userSettings: userSettings,
      resetMasterPasswordService: resetMasterPasswordService, localLoginHandler: localLoginHandler
    ) { [weak self] completion in
      guard let self = self else { return }
      switch completion {
      case .logout:
        self.completion(.success(.logout))
      case .authenticated(let mode):
        self.lastSuccessfulAuthenticationMode = mode.authenticationLog
        self.updateStep(for: mode)
      }
    }
  }
}

extension LocalLoginUnlockViewModel.Completion.AuthenticationMode {
  fileprivate var authenticationLog: Definition.Mode {
    switch self {
    case .masterPassword, .resetMasterPassword, .accountRecovered:
      return .masterPassword
    case .biometry, .rememberMasterPassword:
      return .biometric
    case .pincode:
      return .pin
    case .sso:
      return .sso
    }
  }
}
