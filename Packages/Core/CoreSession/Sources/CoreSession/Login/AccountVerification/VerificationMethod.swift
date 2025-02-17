import DashlaneAPI

public enum VerificationMethod: Hashable {
  case emailToken
  case totp(PushType?)
  case authenticatorPush

  public enum PushType: Hashable {
    case duo
    case authenticator
  }

  public var pushType: PushType? {
    switch self {
    case let .totp(type):
      return type
    default:
      return nil
    }
  }
}

extension AppAPIClient.Authentication.Get2FAStatusUnauthenticated.Response {
  public var pushType: VerificationMethod.PushType? {
    if isDuoEnabled {
      return .duo
    } else if hasDashlaneAuthenticator {
      return .authenticator
    }
    return nil
  }

  public var verificationMethod: VerificationMethod? {
    switch self.type {
    case .emailToken:
      return .emailToken
    case .totpDeviceRegistration:
      return .totp(pushType)
    case .totpLogin:
      return .totp(pushType)
    case .sso:
      return nil
    case .undecodable:
      return nil
    }
  }
}
