import DashTypes
import DashlaneAPI
import Foundation

public typealias EncryptedRemoteKey = AuthenticationCompleteAuthTicketRemoteKeys

public struct DeviceRegistrationData: Equatable, Hashable {
  var initialSettings: String

  public let deviceAccessKey: String
  public let deviceSecretKey: String
  public let analyticsIds: AnalyticsIdentifiers

  let serverKey: String?
  let remoteKeys: [EncryptedRemoteKey]?
  let ssoServerKey: String?
  public let authTicket: AuthTicket
  public init(
    initialSettings: String,
    deviceAccessKey: String,
    deviceSecretKey: String,
    analyticsIds: AnalyticsIdentifiers,
    serverKey: String? = nil,
    remoteKeys: [AuthenticationCompleteAuthTicketRemoteKeys]? = nil,
    ssoServerKey: String? = nil,
    authTicket: String
  ) {
    self.initialSettings = initialSettings
    self.deviceAccessKey = deviceAccessKey
    self.deviceSecretKey = deviceSecretKey
    self.serverKey = serverKey
    self.remoteKeys = remoteKeys
    self.ssoServerKey = ssoServerKey
    self.authTicket = AuthTicket(value: authTicket)
    self.analyticsIds = analyticsIds
  }

  public var masterPasswordRemoteKey: EncryptedRemoteKey? {
    return remoteKeys?.masterPasswordRemoteKey()
  }

  public var ssoRemoteKey: EncryptedRemoteKey? {
    return remoteKeys?.ssoRemoteKey()
  }

  public func remoteKey(for masterKey: MasterKey) -> EncryptedRemoteKey? {
    switch masterKey {
    case .masterPassword:
      return masterPasswordRemoteKey
    case .ssoKey:
      return ssoRemoteKey
    }
  }
}

extension EncryptedRemoteKey: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(uuid)
    hasher.combine(key)
    hasher.combine(type)
  }

}

extension DeviceRegistrationData {
  public static var mock: DeviceRegistrationData {
    DeviceRegistrationData(
      initialSettings: "", deviceAccessKey: "deviceAccessKey", deviceSecretKey: "deviceSecretKey",
      analyticsIds: AnalyticsIdentifiers(device: "device", user: "user"), authTicket: "authTicket")
  }
}
