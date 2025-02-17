import AuthenticationServices
import Combine
import CorePersonalData
import DashTypes
import Foundation
import SwiftTreats

public class AutofillService {
  private let appExtensionCommunicationCenter: AppExtensionCommunicationCenter
  let incrementalIdentityStore: IncrementalIdentityStore
  let queue = DispatchQueue(label: "AutofillServiceQueue", qos: .background)

  @Published
  public var activationStatus: AutofillActivationStatus = .disabled
  var subscriptions: Set<AnyCancellable> = []
  let logger: Logger
  var refreshStatusTask: Task<Void, Never>?

  public init(
    channel: AppExtensionCommunicationCenter.Channel,
    identityStore: IdentityStore = ASCredentialIdentityStore.shared,
    credentialsPublisher: some Publisher<some Collection<Credential>, Never>,
    passkeysPublisher: some Publisher<some Collection<Passkey>, Never>,
    refreshStatusTrigger: AnyPublisher<Notification, Never>? = NotificationCenter.default
      .willEnterForegroundNotificationPublisher()?.eraseToAnyPublisher(),
    cryptoEngine: CryptoEngine,
    logger: Logger, snapshotFolderURL: URL
  ) {
    self.appExtensionCommunicationCenter = .init(
      channel: channel, baseURL: ApplicationGroup.documentsURL)

    let snapshotPersistor = FileSnapshotPersistor(
      folderURL: snapshotFolderURL,
      cryptoEngine: cryptoEngine,
      logger: logger)
    self.incrementalIdentityStore = IncrementalIdentityStore(
      identityStore: identityStore,
      snapshotPersistor: snapshotPersistor)
    self.logger = logger

    refreshStatusTask = Task { @MainActor in
      activationStatus = await identityStore.status()

      guard
        let statusSequence = refreshStatusTrigger?
          .values
          .map({ _ in await identityStore.status() })
      else {
        return
      }

      for await status in statusSequence where status != self.activationStatus {
        self.activationStatus = status
      }
    }

    $activationStatus.filter {
      $0 == .enabled
    }
    .removeDuplicates()
    .flatMap { _ in
      credentialsPublisher.combineLatest(passkeysPublisher) { credentials, passkeys in
        return (credentials, passkeys)
      }
    }
    .debounce(for: .milliseconds(500), scheduler: queue)
    .map { (credentials, passkeys) in
      return IncrementalIdentityStore.UpdateRequest(credentials: credentials, passkeys: passkeys)
    }
    .sink { [weak self] request in
      self?.update(with: request)
    }
    .store(in: &subscriptions)
  }

  private func update(with request: IncrementalIdentityStore.UpdateRequest) {
    Task {
      do {
        try await incrementalIdentityStore.update(with: request)
      } catch {
        logger.error("Fail to update identity store", error: error)
      }
    }
  }

  public func unload() async {
    subscriptions.forEach { $0.cancel() }
    do {
      try await incrementalIdentityStore.clear()
    } catch {
      logger.error("Fail to clear store on unload", error: error)
    }
    appExtensionCommunicationCenter.write(message: .userDidLogout)
  }
}

extension AutofillService {
  public func save(_ credential: Credential, oldCredential: Credential?) async {
    do {
      try await incrementalIdentityStore.update(with: .init(new: credential, old: oldCredential))
    } catch {
      logger.error("Fail to update credential \(credential.id)", error: error)
    }
  }

  @available(iOS 17.0, macOS 14.0, *)
  public func save(_ passkey: Passkey, oldPasskey: Passkey?) async {
    do {
      try await incrementalIdentityStore.update(with: .init(new: passkey, old: oldPasskey))
    } catch {
      logger.error("Fail to update passkey \(passkey.id)", error: error)
    }
  }
}

extension AutofillService {
  public static var fakeService: AutofillService {
    .init(
      channel: .fromApp,
      credentialsPublisher: Just<[Credential]>([]).eraseToAnyPublisher(),
      passkeysPublisher: Just<[Passkey]>([]).eraseToAnyPublisher(), cryptoEngine: .mock(),
      logger: .mock, snapshotFolderURL: URL.documentsDirectory)
  }
}
