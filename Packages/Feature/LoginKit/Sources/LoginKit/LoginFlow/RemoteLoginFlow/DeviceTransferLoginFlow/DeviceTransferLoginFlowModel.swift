import CoreCrypto
import CoreLocalization
import CoreSession
import CoreUserTracking
import DashTypes
import DashlaneAPI
import Foundation
import StateMachine
import SwiftTreats
import UIDelight

@MainActor
public class DeviceTransferLoginFlowModel: LoginKitServicesInjecting {

  let login: Login?
  let deviceToDeviceLoginFlowViewModelFactory: DeviceTransferQRCodeFlowModel.Factory
  let securityChallengeFlowModelFactory: DeviceTransferSecurityChallengeFlowModel.Factory
  let completion: @MainActor (Result<DeviceTransferQRCodeFlowModel.Completion, Error>) -> Void
  let deviceTransferRecoveryFlowModelFactory: DeviceTransferRecoveryFlowModel.Factory
  let totpFactory: DeviceTransferOTPLoginViewModel.Factory
  let activityReporter: ActivityReporterProtocol

  enum Step {
    case transferType(Login)
    case securityChallenge(Login)
    case qrcode(Login?, QRCodeFlowStateMachine.State)
    case otp(ThirdPartyOTPLoginStateMachine.State, ThirdPartyOTPOption, AccountTransferInfo)
    case pin(RegistrationData)
    case biometry(Biometry, RegistrationData)
    case recoveryFlow(AccountRecoveryInfo, DeviceInfo)
  }

  @Published
  var steps: [Step]

  public var stateMachine: DeviceTransferLoginFlowStateMachine

  @Published
  var isInProgress = false

  @Published
  var progressState: ProgressionState = .inProgress(L10n.Core.deviceToDeviceLoginProgress)

  @Published
  var error: TransferError?

  public init(
    login: Login?,
    activityReporter: ActivityReporterProtocol,
    stateMachine: DeviceTransferLoginFlowStateMachine,
    totpFactory: DeviceTransferOTPLoginViewModel.Factory,
    deviceToDeviceLoginFlowViewModelFactory: DeviceTransferQRCodeFlowModel.Factory,
    securityChallengeFlowModelFactory: DeviceTransferSecurityChallengeFlowModel.Factory,
    deviceTransferRecoveryFlowModelFactory: DeviceTransferRecoveryFlowModel.Factory,
    completion: @escaping @MainActor (Result<DeviceTransferQRCodeFlowModel.Completion, Error>) ->
      Void
  ) {
    if let login {
      self.steps = [.transferType(login)]
    } else {
      self.steps = [.qrcode(login, .startDeviceTransferQRCodeScan(.waitingForQRCodeScan))]
    }
    self.login = login
    self.activityReporter = activityReporter
    self.deviceToDeviceLoginFlowViewModelFactory = deviceToDeviceLoginFlowViewModelFactory
    self.securityChallengeFlowModelFactory = securityChallengeFlowModelFactory
    self.completion = completion
    self.deviceTransferRecoveryFlowModelFactory = deviceTransferRecoveryFlowModelFactory
    self.totpFactory = totpFactory
    self.stateMachine = stateMachine
  }

  func deviceTransferTypeSelected(event: DeviceTransferLoginFlowStateMachine.Event) async {
    logTransferTypeSelection(event: event)
    await perform(event)
  }

  func enableBiometry(with registerData: RegistrationData) {
    Task {
      var data = registerData
      data.shouldEnableBiometry = true
      await self.perform(.biometryFinished(data))
    }
  }

  func skipBiometry(with registerData: RegistrationData) {
    Task {
      await self.perform(.biometryFinished(registerData))
    }
  }
}

extension DeviceTransferLoginFlowModel {

  func logTransferTypeSelection(event: DeviceTransferLoginFlowStateMachine.Event) {
    switch event {
    case .startSecurityChallengeFlow:
      activityReporter.report(
        UserEvent.TransferNewDevice(
          action: .selectTransferMethod, biometricsEnabled: false,
          loggedInDeviceSelected: .computer, transferMethod: .securityChallenge))
    case .startQRCodeFlow:
      activityReporter.report(
        UserEvent.TransferNewDevice(
          action: .selectTransferMethod, biometricsEnabled: false, loggedInDeviceSelected: .mobile,
          transferMethod: .qrCode))
    default:
      activityReporter.report(
        UserEvent.TransferNewDevice(
          action: .selectTransferMethod, biometricsEnabled: false,
          loggedInDeviceSelected: .noDeviceAvailable, transferMethod: .accountRecoveryKey))
    }
  }

  private func logCompletion(
    isRecoveryLogin: Bool, biometry: Bool, transferMethod: Definition.TransferMethod
  ) {
    self.activityReporter.reportPageShown(CoreUserTracking.Page.loginDeviceTransferSuccess)
    if isRecoveryLogin {
      self.activityReporter.report(
        UserEvent.TransferNewDevice(
          action: .completeDeviceTransfer, biometricsEnabled: biometry,
          loggedInDeviceSelected: .noDeviceAvailable, transferMethod: transferMethod))
    } else {
      self.activityReporter.report(
        UserEvent.TransferNewDevice(
          action: .completeDeviceTransfer, biometricsEnabled: biometry,
          loggedInDeviceSelected: .mobile, transferMethod: transferMethod))
    }
  }
}

@MainActor
extension DeviceTransferLoginFlowModel {
  func makeSecurityChallengeFlowModel(login: Login) -> DeviceTransferSecurityChallengeFlowModel {
    securityChallengeFlowModelFactory.make(login: login) { [weak self] result in
      guard let self = self else {
        return
      }
      self.handleResult(result)
    }
  }

  func makeDeviceToDeviceQRCodeLoginFlowModel(login: Login?, state: QRCodeFlowStateMachine.State)
    -> DeviceTransferQRCodeFlowModel
  {
    deviceToDeviceLoginFlowViewModelFactory.make(login: login, state: state) { [weak self] result in
      guard let self = self else {
        return
      }
      self.handleResult(result)
    }
  }

  func handleResult(_ result: DeviceTransferCompletion) {
    Task {
      switch result {
      case let .completed(data):
        await self.perform(.dataReceived(data, .securityChallenge))
      case let .recovery(info):
        self.activityReporter.report(
          UserEvent.TransferNewDevice(
            action: .selectTransferMethod, biometricsEnabled: false,
            loggedInDeviceSelected: .noDeviceAvailable, transferMethod: .accountRecoveryKey))
        await self.perform(.startRecovery(info.login))
      case .dismiss:
        await self.perform(.cancel)
      case .changeFlow:
        await self.perform(.startQRCodeFlow)
      }
    }
  }

  func makePinCodeSetupViewModel(registerData: RegistrationData) -> PinCodeSetupViewModel {
    PinCodeSetupViewModel(login: registerData.transferData.login) { [weak self] result in
      guard let self = self else {
        return
      }
      Task {
        switch result {
        case let .completed(pin):
          var data = registerData
          data.pin = pin
          await self.perform(.pinFinished(data, Device.biometryType))
        case .cancel:
          await self.perform(.cancel)
        }
      }
    }
  }

  func makeDeviceToDeviceOTPLoginViewModel(
    initialState: ThirdPartyOTPLoginStateMachine.State,
    option: ThirdPartyOTPOption,
    data: AccountTransferInfo
  ) -> DeviceTransferOTPLoginViewModel {
    totpFactory.make(
      initialState: initialState,
      login: data.login,
      option: option
    ) { [weak self] completionType in
      guard let self = self else { return }
      switch completionType {
      case let .success(authTicket, _):
        let registerData = RegistrationData(
          transferData: data, authTicket: authTicket, transferMethod: .qrCode)
        Task {
          await self.perform(.otpDidFinish(registerData))
        }
      case .error:
        Task {
          await self.perform(.errorOccurred)
        }
      case .cancel:
        self.completion(.success(.logout))
      }
    }
  }

  func makeAccountRecoveryFlowModel(info: AccountRecoveryInfo, deviceInfo: DeviceInfo)
    -> DeviceTransferRecoveryFlowModel
  {
    return deviceTransferRecoveryFlowModelFactory.make(
      accountRecoveryInfo: info, deviceInfo: deviceInfo,
      completion: { [weak self] result in
        guard let self = self else {
          return
        }

        switch result {
        case let .completed(masterKey, authTicket):
          Task {
            let data = AccountTransferInfo(
              login: info.login, masterKey: masterKey, accountType: info.accountType,
              authTicket: authTicket)
            await self.perform(
              .accountRecoveryDidFinish(
                RegistrationData(
                  transferData: data, authTicket: authTicket, isRecoveryLogin: true,
                  transferMethod: .accountRecoveryKey)))
          }
        default:
          Task {
            await self.perform(.cancel)
          }
        }
      }
    )
  }
}

@MainActor
extension DeviceTransferLoginFlowModel: StateMachineBasedObservableObject {
  public func update(
    for event: DeviceTransferLoginFlowStateMachine.Event,
    from oldState: DeviceTransferLoginFlowStateMachine.State,
    to newState: DeviceTransferLoginFlowStateMachine.State
  ) {

    switch (newState, event) {
    case (.cancel, _):
      self.completion(.success(.dismiss))
    case (_, .cancel):
      _ = self.steps.popLast()
    case (let .awaitingTransferType(login), _):
      self.steps.append(.transferType(login))
    case (.startSecurityChallengeFlow, _):
      self.steps.append(.securityChallenge(login!))
    case (let .startQrCodeFlow(state), _):
      self.steps.append(.qrcode(login, state))
    case (let .pin(registerData), _):
      self.steps.append(.pin(registerData))
    case (let .biometry(biometry, registerData), _):
      self.steps.append(.biometry(biometry, registerData))
    case (let .readyToLoadAccount(data), _):
      isInProgress = true
      Task {
        await self.perform(.loadAccount(data))
      }

    case (let .completed(session), _):
      self.completion(
        .success(
          .completed(session, LoginFlowLogInfo(loginMode: .deviceTransfer, verificationMode: .none))
        ))

    case (let .recovery(info, deviceInfo), _):
      self.steps.append(.recoveryFlow(info, deviceInfo))
    case (.error, _):
      self.error = .unknown
    case (let .startThirdPartyOTPFlow(initialState, option, data), _):
      self.steps.append(.otp(initialState, option, data))
    }
  }
}

extension TransferMethod {
  var logTransferMethod: Definition.TransferMethod {
    switch self {
    case .accountRecoveryKey:
      return .accountRecoveryKey
    case .qrCode:
      return .qrCode
    case .securityChallenge:
      return .securityChallenge
    }
  }
}
