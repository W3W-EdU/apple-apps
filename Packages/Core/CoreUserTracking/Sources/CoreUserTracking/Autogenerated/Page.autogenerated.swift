public enum Page: String, Encodable, Sendable {
  case `importLeaveProcess` = "import/leave_process"
  case `itemDriverLicenceDetails` = "item/driver_licence/details"
  case `navigationRevampAnnouncementNewFilters` = "navigation_revamp_announcement/new_filters"
  case `itemSecureNoteDetails` = "item/secure_note/details"
  case `notificationGettingStartedList` = "notification/getting_started/list"
  case `notificationYourAccount` = "notification/your_account"
  case `settingsSecurityProtectWithMasterPasswordDisable` =
    "settings/security/protect_with_master_password/disable"
  case `settingsSecurityRecoveryKeyDisable` = "settings/security/recovery_key/disable"
  case `autofillNotificationAuthenticate` = "autofill/notification/authenticate"
  case `settingsSecurityTwoFactorAuthenticationDisable6DigitsCode` =
    "settings/security/two_factor_authentication/disable/6_digits_code"
  case `settingsSecurityTwoFactorAuthenticationEnableBackupCodes` =
    "settings/security/two_factor_authentication/enable/backup_codes"
  case `collectionEdit` = "collection/edit"
  case `autofillNotificationAuthenticatePasskeyUserVerificationPin` =
    "autofill/notification/authenticate/passkey/user_verification/pin"
  case `availablePlansIntroductoryOffersEssentialsDetails` =
    "available_plans/introductory_offers/essentials_details"
  case `dropdownAutofillPasswordGeneratorOptions` = "dropdown/autofill/password_generator/options"
  case `installExtensionModal` = "install_extension_modal"
  case `importCsv` = "import/csv"
  case `joinDashlaneTeamCreateMasterPassword` = "join_dashlane_team/create_master_password"
  case `loginEnforce2FaBusiness` = "login/enforce_2fa_business"
  case `itemPayment` = "item/payment"
  case `autofillNotificationOnboardingTryAgainOrGoApp` =
    "autofill/notification/onboarding/try_again_or_go_app"
  case `unlockMp` = "unlock/mp"
  case `itemPersonalInfo` = "item/personal_info"
  case `dropdown`
  case `settingsSecurityProtectWithMasterPassword` =
    "settings/security/protect_with_master_password"
  case `family`
  case `confirmItemDeletion` = "confirm_item_deletion"
  case `accountCreationEmail` = "account_creation/email"
  case `itemPasskey` = "item/passkey"
  case `loginDeviceTransferSetupBiometrics` = "login/device_transfer/setup_biometrics"
  case `settingsSecurityProtectWithMasterPasswordCredentials` =
    "settings/security/protect_with_master_password_credentials"
  case `toolsAuthenticator` = "tools/authenticator"
  case `settingsSecurityRecoveryKey` = "settings/security/recovery_key"
  case `notificationYourAccountList` = "notification/your_account/list"
  case `autofillAccessibilitySuggestion` = "autofill/accessibility/suggestion"
  case `notificationNew` = "notification/new"
  case `plansManagementRefundDone` = "plans_management/refund_done"
  case `collectionDetails` = "collection/details"
  case `settingsSecurityTwoFactorAuthenticationEnableSuccessConfirmation` =
    "settings/security/two_factor_authentication/enable/success_confirmation"
  case `homeOnboardingChecklistAddFirstLogin` = "home/onboarding_checklist/add_first_login"
  case `notificationPromotions` = "notification/promotions"
  case `tacAccountSendFeedback` = "tac/account/send_feedback"
  case `autofillNotificationB2BTrialEndReached` = "autofill/notification/b2b_trial_end_reached"
  case `tacAccountContactSupportBusiness` = "tac/account/contact_support/business"
  case `homeSecureNotes` = "home/secure_notes"
  case `itemSocialSecurityStatement` = "item/social_security_statement"
  case `modalEndOfTrialReached` = "modal/end_of_trial_reached"
  case `settingsAddNewDeviceScanQrCode` = "settings/add_new_device/scan_qr_code"
  case `itemDriverLicenceCreate` = "item/driver_licence/create"
  case `tacSso` = "tac/sso"
  case `autofillNotificationAuthenticatePasskeySuccess` =
    "autofill/notification/authenticate/passkey/success"
  case `help`
  case `autofillExplorePasswords` = "autofill/explore_passwords"
  case `settingsSecurityTwoFactorAuthenticationEnable` =
    "settings/security/two_factor_authentication/enable"
  case `notificationAutofillReplace` = "notification/autofill/replace"
  case `notification`
  case `sharingGroupItemList` = "sharing/group/item/list"
  case `accountCreationPasswordTips` = "account_creation/password_tips"
  case `accountFrozenModal` = "account_frozen_modal"
  case `loginWebauthn` = "login/webauthn"
  case `authenticatorApp` = "authenticator_app"
  case `settingsSecurityRecoveryKeyStore` = "settings/security/recovery_key/store"
  case `autofillDropdownAddEmail` = "autofill/dropdown/add_email"
  case `homeOnboardingChecklistModalDisplay` = "home/onboarding_checklist_modal_display"
  case `itemIdentityDetails` = "item/identity/details"
  case `itemQuickActionsDropdown` = "item/quick_actions_dropdown"
  case `settingsSecurityProtectWithMasterPasswordPaymentsEnable` =
    "settings/security/protect_with_master_password_payments/enable"
  case `settingsSecurityTwoFactorAuthentication` = "settings/security/two_factor_authentication"
  case `unlockBiometric` = "unlock/biometric"
  case `toolsMore` = "tools/more"
  case `plansManagementAskCancel` = "plans_management/ask_cancel"
  case `settingsMoreFeatures` = "settings/more_features"
  case `toolsPasswordChangerCompatibleCredentialsListConfirmChange` =
    "tools/password_changer/compatible_credentials_list/confirm_change"
  case `settingsAutofillPreferences` = "settings/autofill/preferences"
  case `keyboardAutofill` = "keyboard/autofill"
  case `autofillDropdownSettings` = "autofill/dropdown/settings"
  case `itemSecureNoteCreate` = "item/secure_note/create"
  case `itemCredentialList` = "item/credential/list"
  case `plansManagementRefundError` = "plans_management/refund_error"
  case `itemSocialSecurityStatementCreate` = "item/social_security_statement/create"
  case `onboardingTrustScreens` = "onboarding/trust_screens"
  case `autofillTutorial` = "autofill/tutorial"
  case `settingsSecurityTwoFactorAuthenticationEnableSecurityLevel` =
    "settings/security/two_factor_authentication/enable/security_level"
  case `settingsSecurityProtectWithMasterPasswordCredentialsDisable` =
    "settings/security/protect_with_master_password_credentials/disable"
  case `userProfilingFamiliarityWithDashlane` = "user_profiling/familiarity_with_dashlane"
  case `toolsAuthenticatorLogins` = "tools/authenticator/logins"
  case `itemPhoneCreate` = "item/phone/create"
  case `item`
  case `tacAccountContactSupportTeam` = "tac/account/contact_support/team"
  case `autofillNotificationAuthenticatePasskeyUserVerification` =
    "autofill/notification/authenticate/passkey/user_verification"
  case `itemPhone` = "item/phone"
  case `admin`
  case `autofillDropdownAddAddress` = "autofill/dropdown/add_address"
  case `homeOnboardingChecklistAddFirstLoginWebsiteList` =
    "home/onboarding_checklist/add_first_login/website_list"
  case `autofillKeyboard` = "autofill/keyboard"
  case `autofillDropdownReactivationLoginOnly` = "autofill/dropdown/reactivation_login_only"
  case `privacySettings` = "privacy_settings"
  case `homeQuickActionsDropdown` = "home/quick_actions_dropdown"
  case `passwordGenerator` = "password_generator"
  case `itemAddressDetails` = "item/address/details"
  case `autofillExplorePasswordsCreateConfirmation` =
    "autofill/explore_passwords/create/confirmation"
  case `itemPassportCreate` = "item/passport/create"
  case `autofillNotificationFrozenAccount` = "autofill/notification/frozen_account"
  case `accountCreationTermsServices` = "account_creation/terms_services"
  case `tacAccountPaymentMethod` = "tac/account/payment_method"
  case `importCsvPreviewDataUpload` = "import/csv/preview_data_upload"
  case `tacSettingsSso` = "tac/settings/sso"
  case `autofillNotificationSavePasskeySuccess` = "autofill/notification/save/passkey/success"
  case `importCsvDecryptLastpassVault` = "import/csv/decrypt_lastpass_vault"
  case `loginDeviceTransferSetPin` = "login/device_transfer/set_pin"
  case `unlock`
  case `home`
  case `homePayments` = "home/payments"
  case `autofillNotificationAutologin` = "autofill/notification/autologin"
  case `plansManagement` = "plans_management"
  case `importBackupfileEnterPassword` = "import/backupfile/enter_password"
  case `settingsSecurityProtectWithMasterPasswordPaymentsDisable` =
    "settings/security/protect_with_master_password_payments/disable"
  case `tacAccountContactSupport` = "tac/account/contact_support"
  case `autofill`
  case `dropdownAutofillSuggestionOptions` = "dropdown/autofill/suggestion/options"
  case `toolsAuthenticatorSetup` = "tools/authenticator/setup"
  case `autofillNotificationFreeUserPasswordLimitReached` =
    "autofill/notification/free_user_password_limit_reached"
  case `autofillAuthentication` = "autofill/authentication"
  case `settingsSecurityRecoveryKeyGenerateNew` = "settings/security/recovery_key/generate_new"
  case `itemCreditCardCreate` = "item/credit_card/create"
  case `settingsAutofill` = "settings/autofill"
  case `notificationSharing` = "notification/sharing"
  case `settingsAddNewDeviceSuccess` = "settings/add_new_device/success"
  case `loginDeviceTransferRequestRejected` = "login/device_transfer/request_rejected"
  case `notificationFollowUpNotificationReminder` = "notification/follow_up_notification/reminder"
  case `homeAll` = "home/all"
  case `settingsDevice` = "settings/device"
  case `settingsAddNewDeviceTransferCancelled` = "settings/add_new_device/transfer_cancelled"
  case `autofillDropdownAddFiscal` = "autofill/dropdown/add_fiscal"
  case `rightClickMenu` = "right_click_menu"
  case `loginDeviceTransferSecurityChallenge` = "login/device_transfer/security_challenge"
  case `tacOrderConfirmation` = "tac/order_confirmation"
  case `tac`
  case `itemWebsiteDetails` = "item/website/details"
  case `loginMasterPassword` = "login/master_password"
  case `notificationNewList` = "notification/new/list"
  case `tacSettingsPolicies` = "tac/settings/policies"
  case `importSessionTimeout` = "import/session_timeout"
  case `tacSettingsDirectorySyncActiveDirectory` = "tac/settings/directory_sync/active_directory"
  case `familyDashboard` = "family/dashboard"
  case `toolsPasswordHealthListReused` = "tools/password_health/list/reused"
  case `toolsPasswordHealth` = "tools/password_health"
  case `itemIdCardCreate` = "item/id_card/create"
  case `tacModalReasonsToExtendTrial` = "tac/modal_reasons_to_extend_trial"
  case `authenticatorAppAddAccountTokenSelectSetupMethod` =
    "authenticator_app/add_account_token/select_setup_method"
  case `loginMasterPasswordAccountRecoveryEnterRecoveryKey` =
    "login/master_password/account_recovery_enter_recovery_key"
  case `toolsDarkWebMonitoring` = "tools/dark_web_monitoring"
  case `toolsDarkWebMonitoringAlert` = "tools/dark_web_monitoring/alert"
  case `settingsPlanPage` = "settings/plan_page"
  case `autofillNotificationAuthenticatePasskeyUserVerificationSetupLocalUnlock` =
    "autofill/notification/authenticate/passkey/user_verification/setup_local_unlock"
  case `loginDeviceTransferSetupBiometricsError` = "login/device_transfer/setup_biometrics/error"
  case `tacAccount` = "tac/account"
  case `passwordHistorySaved` = "password_history/saved"
  case `tacSettingsDirectorySyncSelfHostedScim` = "tac/settings/directory_sync/self_hosted_scim"
  case `toolsPasswordChangerCompatibleCredentialsListEmptyState` =
    "tools/password_changer/compatible_credentials_list/empty_state"
  case `notificationFollowUpNotificationDiscovery` = "notification/follow_up_notification/discovery"
  case `toolsPasswordHealthList` = "tools/password_health/list"
  case `settingsSecurityChangeMasterPassword` = "settings/security/change_master_password"
  case `autofillDropdownAddPaypal` = "autofill/dropdown/add_paypal"
  case `joinDashlaneTeam` = "join_dashlane_team"
  case `tacUserList` = "tac/user/list"
  case `authenticatorAppAddAccountTokenHowToSetupCode` =
    "authenticator_app/add_account_token/how_to_setup_code"
  case `toolsNewDevice` = "tools/new_device"
  case `importBackupfile` = "import/backupfile"
  case `itemBankStatementDetails` = "item/bank_statement/details"
  case `login`
  case `autofillDropdownAddIdentity` = "autofill/dropdown/add_identity"
  case `availablePlansIntroductoryOffersPremiumDetails` =
    "available_plans/introductory_offers/premium_details"
  case `loginDeviceTransfer2Fa` = "login/device_transfer/2fa"
  case `notificationHome` = "notification/home"
  case `dropdownAutofillSuggestionOptionsCorrection` =
    "dropdown/autofill/suggestion/options/correction"
  case `autofillNotificationSave` = "autofill/notification/save"
  case `availablePlansIntroductoryOffersFamilyDetails` =
    "available_plans/introductory_offers/family_details"
  case `plansManagementCancelDone` = "plans_management/cancel_done"
  case `itemPhoneDetails` = "item/phone/details"
  case `tacAccountTrialEndModal` = "tac/account/trial_end_modal"
  case `autofillExplorePasswordsSearch` = "autofill/explore_passwords/search"
  case `itemPaypalDetails` = "item/paypal/details"
  case `reviewRateUsChromeWebStore` = "review/rate_us_chrome_web_store"
  case `sharingGroup` = "sharing/group"
  case `sharingGroupMember` = "sharing/group/member"
  case `settingsSecurityRecoveryKeySuccess` = "settings/security/recovery_key/success"
  case `itemIdCardDetails` = "item/id_card/details"
  case `authenticatorAppHome` = "authenticator_app/home"
  case `adminConsolePreview` = "admin/console_preview"
  case `loginDeviceTransferQrCode` = "login/device_transfer/qr_code"
  case `importCsvSuccess` = "import/csv/success"
  case `tacSettings` = "tac/settings"
  case `tacSettingsDirectorySyncSamlProvisioning` = "tac/settings/directory_sync/saml_provisioning"
  case `autofillNotificationUpdateOrSaveAsNew` = "autofill/notification/update_or_save_as_new"
  case `toolsPasswordGeneratorHistory` = "tools/password_generator/history"
  case `autofillNotificationRememberAlert` = "autofill/notification/remember_alert"
  case `loginTokenAuthenticator` = "login/token/authenticator"
  case `notificationFollowUpNotification` = "notification/follow_up_notification"
  case `settingsSecurityProtectWithMasterPasswordIdsEnable` =
    "settings/security/protect_with_master_password_ids/enable"
  case `availablePlansPremiumDetails` = "available_plans/premium_details"
  case `collectionDelete` = "collection/delete"
  case `settingsSecurityProtectWithMasterPasswordEnable` =
    "settings/security/protect_with_master_password/enable"
  case `itemSecureNoteList` = "item/secure_note/list"
  case `tacModalContactSupport` = "tac/modal_contact_support"
  case `notificationSharingList` = "notification/sharing/list"
  case `tacActivityList` = "tac/activity/list"
  case `importDash` = "import/dash"
  case `itemCompanyCreate` = "item/company/create"
  case `autofillDropdownAddWebsite` = "autofill/dropdown/add_website"
  case `settingsExport` = "settings/export"
  case `itemPersonalInfoList` = "item/personal_info/list"
  case `loginTokenEmail` = "login/token/email"
  case `autofillDropdownAddCustomField` = "autofill/dropdown/add_custom_field"
  case `itemIdentity` = "item/identity"
  case `toolsPasswordChangerCredentialConfirmChange` =
    "tools/password_changer/credential/confirm_change"
  case `joinDashlaneTeamExpiredInvitation` = "join_dashlane_team/expired_invitation"
  case `itemSecureNote` = "item/secure_note"
  case `homeOnboardingChecklistTryAutofillStorePersonalInfo` =
    "home/onboarding_checklist/try_autofill/store_personal_info"
  case `settingsSecurityTwoFactorAuthenticationEnableBackupPhoneNumber` =
    "settings/security/two_factor_authentication/enable/backup_phone_number"
  case `toolsPasswordGenerator` = "tools/password_generator"
  case `itemPassport` = "item/passport"
  case `accountCreationUnlockOption` = "account_creation/unlock_option"
  case `itemPasskeyDetails` = "item/passkey/details"
  case `importSelectPasswordSource` = "import/select_password_source"
  case `homeOnboardingChecklist` = "home/onboarding_checklist"
  case `navigationRevampAnnouncement` = "navigation_revamp_announcement"
  case `tacSettingsDirectorySync` = "tac/settings/directory_sync"
  case `autofillDropdownAddSocialSecurity` = "autofill/dropdown/add_social_security"
  case `collection`
  case `navigationRevampAnnouncementNewLook` = "navigation_revamp_announcement/new_look"
  case `settingsDeviceList` = "settings/device/list"
  case `importCsvLoginToLastpass` = "import/csv/login_to_lastpass"
  case `joinDashlaneTeamPendingInvitation` = "join_dashlane_team/pending_invitation"
  case `tacGroup` = "tac/group"
  case `itemFiscalStatement` = "item/fiscal_statement"
  case `autofillDropdownReactivationLoginOrCreateAccount` =
    "autofill/dropdown/reactivation_login_or_create_account"
  case `settingsSecurityProtectWithMasterPasswordSecureNotes` =
    "settings/security/protect_with_master_password_secure_notes"
  case `toolsPasswordHealthListCompromised` = "tools/password_health/list/compromised"
  case `currentPlanDwmLearnMore` = "current_plan/dwm_learn_more"
  case `passwordHistoryUnsaved` = "password_history/unsaved"
  case `itemFiscalStatementCreate` = "item/fiscal_statement/create"
  case `settingsSecurityTwoFactorAuthenticationEnableDownloadAuthenticator` =
    "settings/security/two_factor_authentication/enable/download_authenticator"
  case `itemEmailDetails` = "item/email/details"
  case `availablePlansFamilyDetails` = "available_plans/family_details"
  case `homeAdminOnboardingChecklist` = "home/admin_onboarding_checklist"
  case `plansManagementCancelError` = "plans_management/cancel_error"
  case `toolsAuthenticatorSetupTextCode` = "tools/authenticator/setup/text_code"
  case `loginToken` = "login/token"
  case `homeAddItemDropdown` = "home/add_item_dropdown"
  case `itemPaypal` = "item/paypal"
  case `loginDeviceTransferHelp` = "login/device_transfer/help"
  case `tacSsoPaywall` = "tac/sso/paywall"
  case `autofillNotificationSuggestion` = "autofill/notification/suggestion"
  case `loginDeviceTransferQrCodeError` = "login/device_transfer/qr_code/error"
  case `toolsVpn` = "tools/vpn"
  case `itemEmail` = "item/email"
  case `itemWebsiteCreate` = "item/website/create"
  case `tacSettingsDirectorySyncScimProvisioning` = "tac/settings/directory_sync/scim_provisioning"
  case `itemCredentialCreateSelectWebsite` = "item/credential/create_select_website"
  case `authenticatorAppIntroSecurelyLogin` = "authenticator_app/intro_securely_login"
  case `dropdownAutofill` = "dropdown/autofill"
  case `importChrome` = "import/chrome"
  case `itemCompany` = "item/company"
  case `tacOnboardingChecklist` = "tac/onboarding_checklist"
  case `dropdownAutofillPasswordGenerator` = "dropdown/autofill/password_generator"
  case `tacGroupDetails` = "tac/group/details"
  case `review`
  case `authenticatorAppAddAccountTokenHowToSetupCodeHelp` =
    "authenticator_app/add_account_token/how_to_setup_code/help"
  case `loginMasterPasswordAccountRecoveryCreateNewMp` =
    "login/master_password/account_recovery_create_new_mp"
  case `onboarding`
  case `tacModalPlansComparison` = "tac/modal_plans_comparison"
  case `itemCredentialCreateOptionList` = "item/credential/create_option/list"
  case `autofillDropdownAddPassword` = "autofill/dropdown/add_password"
  case `notificationOnboardingPinExtension` = "notification/onboarding/pin_extension"
  case `accountCreation` = "account_creation"
  case `itemCredentialDetailsWebsites` = "item/credential/details/websites"
  case `collectionQuickActionsDropdown` = "collection/quick_actions_dropdown"
  case `notificationOnboarding` = "notification/onboarding"
  case `menu`
  case `itemCredential` = "item/credential"
  case `settingsSecurityProtectWithMasterPasswordIdsDisable` =
    "settings/security/protect_with_master_password_ids/disable"
  case `settingsSecurityTwoFactorAuthenticationDisable` =
    "settings/security/two_factor_authentication/disable"
  case `sharingCreate` = "sharing/create"
  case `tacModalTrialHasBeenExtended` = "tac/modal_trial_has_been_extended"
  case `toolsPasswordHealthOverview` = "tools/password_health/overview"
  case `autofillNotificationWarning` = "autofill/notification/warning"
  case `settingsThiswebsite` = "settings/thiswebsite"
  case `toolsPasswordHealthListWeak` = "tools/password_health/list/weak"
  case `introductoryOffers` = "introductory_offers"
  case `notificationSecurityDetails` = "notification/security/details"
  case `dropdownAutofillReactivation` = "dropdown/autofill/reactivation"
  case `autofillTutorialHowToSyncInformation` = "autofill/tutorial/how_to_sync_information"
  case `itemIdCard` = "item/id_card"
  case `notificationSecurity` = "notification/security"
  case `settingsSecurityProtectWithMasterPasswordPayments` =
    "settings/security/protect_with_master_password_payments"
  case `availablePlansFreeDetails` = "available_plans/free_details"
  case `tacModalReasonsToCancelSubscription` = "tac/modal_reasons_to_cancel_subscription"
  case `authenticatorAppAddAccountTokenHowToTurnOn2Fa` =
    "authenticator_app/add_account_token/how_to_turn_on_2fa"
  case `search`
  case `autofillNotificationAuthenticatePasskey` = "autofill/notification/authenticate/passkey"
  case `autofillNotificationAuthenticatePasskeyUserVerificationError` =
    "autofill/notification/authenticate/passkey/user_verification/error"
  case `settingsSecurityRecoveryKeyEnable` = "settings/security/recovery_key/enable"
  case `tacDarkWebInsights` = "tac/dark_web_insights"
  case `userProfiling` = "user_profiling"
  case `toolsAuthenticatorWelcome` = "tools/authenticator/welcome"
  case `itemIdList` = "item/id/list"
  case `autofillNotification` = "autofill/notification"
  case `autofillNotificationSavePasskey` = "autofill/notification/save/passkey"
  case `loginDeviceTransferSuccess` = "login/device_transfer/success"
  case `paywallPasswordChanger` = "paywall/password_changer"
  case `accountCreationConfirmMasterPassword` = "account_creation/confirm_master_password"
  case `passwordHistory` = "password_history"
  case `notificationAutofill` = "notification/autofill"
  case `tacSettingsDirectorySyncPaywall` = "tac/settings/directory_sync/paywall"
  case `itemWebsite` = "item/website"
  case `sharingCreatePermission` = "sharing/create/permission"
  case `settingsAskAutofillActivation` = "settings/ask_autofill_activation"
  case `autofillDropdownAddBankStatement` = "autofill/dropdown/add_bank_statement"
  case `itemSecretCreate` = "item/secret/create"
  case `itemCredentialCreateOption` = "item/credential/create_option"
  case `background`
  case `rightClickMenuTutorial` = "right_click_menu/tutorial"
  case `loginEmail` = "login/email"
  case `navigationRevampAnnouncementWelcome` = "navigation_revamp_announcement/welcome"
  case `sharingCreateMember` = "sharing/create/member"
  case `settingsAddNewDevice` = "settings/add_new_device"
  case `autofillNotificationLoginCreated` = "autofill/notification/login_created"
  case `toolsPasswordChangerErrorLoginFailure` = "tools/password_changer/error/login_failure"
  case `referral`
  case `tacActivityDownload` = "tac/activity/download"
  case `paywallSharingLimit` = "paywall/sharing_limit"
  case `toolsPasswordChangerCompatibleCredentialsList` =
    "tools/password_changer/compatible_credentials_list"
  case `autofillNotificationOnboarding` = "autofill/notification/onboarding"
  case `accountCreationCreateMasterPassword` = "account_creation/create_master_password"
  case `settingsAccountChangeContactEmail` = "settings/account/change_contact_email"
  case `paywallB2B` = "paywall/b2b"
  case `toolsPasswordChangerErrorUnknownError` = "tools/password_changer/error/unknown_error"
  case `autofillNotificationDataCapture` = "autofill/notification/data_capture"
  case `tacActivity` = "tac/activity"
  case `authenticatorAppAddAccountTokenHowToTurnOn2FaHelp` =
    "authenticator_app/add_account_token/how_to_turn_on_2fa/help"
  case `itemAddress` = "item/address"
  case `settingsAccount` = "settings/account"
  case `autofillExplorePasswordsCreate` = "autofill/explore_passwords/create"
  case `autofillNotificationAuthenticatePasskeyUserVerificationBiometric` =
    "autofill/notification/authenticate/passkey/user_verification/biometric"
  case `notificationAutofillDataCapture` = "notification/autofill/data_capture"
  case `settingsAddNewDeviceSecurityChallenge` = "settings/add_new_device/security_challenge"
  case `paywallSecureNotes` = "paywall/secure_notes"
  case `autofillDropdown` = "autofill/dropdown"
  case `tacActivityBeta` = "tac/activity/beta"
  case `settingsAddNewDeviceTimeout` = "settings/add_new_device/timeout"
  case `toolsDarkWebMonitoringList` = "tools/dark_web_monitoring/list"
  case `autofillDropdownAddCreditCard` = "autofill/dropdown/add_credit_card"
  case `autofillDropdownSuggestion` = "autofill/dropdown/suggestion"
  case `autofillNotificationOnboardingFirstPasswordSaved` =
    "autofill/notification/onboarding/first_password_saved"
  case `availablePlansEssentialsDetails` = "available_plans/essentials_details"
  case `settingsSecurity` = "settings/security"
  case `autofillDropdownAddCompany` = "autofill/dropdown/add_company"
  case `sharingMember` = "sharing/member"
  case `settingsAddNewDeviceError` = "settings/add_new_device/error"
  case `autofillKeyboardSuggestion` = "autofill/keyboard/suggestion"
  case `sharingGroupItem` = "sharing/group/item"
  case `sharingMemberDetails` = "sharing/member/details"
  case `toolsVpnPrivacyConsent` = "tools/vpn/privacy_consent"
  case `settingsGeneral` = "settings/general"
  case `itemId` = "item/id"
  case `tacConfirmSubscriptionCancellationRequestSubmission` =
    "tac/confirm_subscription_cancellation_request_submission"
  case `itemPaypalCreate` = "item/paypal/create"
  case `import`
  case `settingsMore` = "settings/more"
  case `paywallDarkWebMonitoring` = "paywall/dark_web_monitoring"
  case `importComputer` = "import/computer"
  case `itemSecretList` = "item/secret/list"
  case `paywallVpn` = "paywall/vpn"
  case `autofillDropdownAddDriverLicense` = "autofill/dropdown/add_driver_license"
  case `loginDeviceTransfer` = "login/device_transfer"
  case `trialUpgradeSuggestion` = "trial_upgrade_suggestion"
  case `autofillTutorialHowToLogin` = "autofill/tutorial/how_to_login"
  case `settingsSecurityProtectWithMasterPasswordSecureNotesDisable` =
    "settings/security/protect_with_master_password_secure_notes/disable"
  case `autofillNotificationPhishingPrevention` = "autofill/notification/phishing_prevention"
  case `toolsPasswordHealthListExcluded` = "tools/password_health/list/excluded"
  case `settingsSecurityProtectWithMasterPasswordSecureNotesEnable` =
    "settings/security/protect_with_master_password_secure_notes/enable"
  case `paywall`
  case `homeAddItem` = "home/add_item"
  case `autofillNotificationLinkDomain` = "autofill/notification/link_domain"
  case `joinDashlaneTeamInstallExtension` = "join_dashlane_team/install_extension"
  case `autofillDropdownPasswordGeneratorSettings` = "autofill/dropdown/password_generator/settings"
  case `autofillDropdownSuggestionSearch` = "autofill/dropdown/suggestion/search"
  case `itemAll` = "item/all"
  case `toolsPasswordChangerErrorNetworkFailure` = "tools/password_changer/error/network_failure"
  case `itemCompanyDetails` = "item/company/details"
  case `toolsPasswordChangerCredential` = "tools/password_changer/credential"
  case `authenticatorAppAddAccountTokenHowToLogInAccount` =
    "authenticator_app/add_account_token/how_to_log_in_account"
  case `settingsSecurityTwoFactorAuthenticationDisableBackupCode` =
    "settings/security/two_factor_authentication/disable/backup_code"
  case `settingsSecurityTwoFactorAuthenticationEnable6DigitsCode` =
    "settings/security/two_factor_authentication/enable/6_digits_code"
  case `keyboardAutofillSuggestion` = "keyboard/autofill/suggestion"
  case `collectionCreate` = "collection/create"
  case `toolsPasswordChanger` = "tools/password_changer"
  case `joinDashlaneTeamEnterEmailAddress` = "join_dashlane_team/enter_email_address"
  case `unlockPin` = "unlock/pin"
  case `itemAddressCreate` = "item/address/create"
  case `itemPassportDetails` = "item/passport/details"
  case `tacGroupList` = "tac/group/list"
  case `accountCreationCreateAccount` = "account_creation/create_account"
  case `availablePlansIntroductoryOffers` = "available_plans/introductory_offers"
  case `tacDashboard` = "tac/dashboard"
  case `toolsAuthenticatorSetupQrCode` = "tools/authenticator/setup/qr_code"
  case `itemSecretDetails` = "item/secret/details"
  case `autofillDropdownCorrect` = "autofill/dropdown/correct"
  case `homeOnboardingChecklistAddDevice` = "home/onboarding_checklist/add_device"
  case `notificationAutofillSave` = "notification/autofill/save"
  case `paywallFreeUserPasswordLimitReached` = "paywall/free_user_password_limit_reached"
  case `tacSettingsSsoLegacy` = "tac/settings/sso_legacy"
  case `itemIdentityCreate` = "item/identity/create"
  case `autofillNotificationOnboardingDashlanePro` = "autofill/notification/onboarding/dashlane_pro"
  case `modal`
  case `authenticatorAppIntroAddSecurityLayer` = "authenticator_app/intro_add_security_layer"
  case `importPasswordManager` = "import/password_manager"
  case `authenticatorAppAddAccountToken` = "authenticator_app/add_account_token"
  case `autofillDropdownPasswordGenerator` = "autofill/dropdown/password_generator"
  case `tacSettingsDirectorySyncConfidentialScim` = "tac/settings/directory_sync/confidential_scim"
  case `dropdownAutofillSuggestion` = "dropdown/autofill/suggestion"
  case `authenticatorAppHomeHelp` = "authenticator_app/home/help"
  case `accountCreationInstallExtension` = "account_creation/install_extension"
  case `toolsPasswordChangerError` = "tools/password_changer/error"
  case `loginSso` = "login/sso"
  case `importDashSuccess` = "import/dash/success"
  case `availablePlans` = "available_plans"
  case `itemSecret` = "item/secret"
  case `loginDeviceTransferAccountRecoveryKey` = "login/device_transfer/account_recovery_key"
  case `tacAccountBuy` = "tac/account/buy"
  case `tacIntegrations` = "tac/integrations"
  case `autofillDropdownReactivationBiometrics` = "autofill/dropdown/reactivation_biometrics"
  case `autofillWarning` = "autofill/warning"
  case `settingsConfirmAutofillActivation` = "settings/confirm_autofill_activation"
  case `itemSocialSecurityStatementDetails` = "item/social_security_statement/details"
  case `tacModalTrialExpiresToday` = "tac/modal_trial_expires_today"
  case `importCsvSelectSpace` = "import/csv/select_space"
  case `itemBankStatement` = "item/bank_statement"
  case `notificationGettingStarted` = "notification/getting_started"
  case `keyboard`
  case `toolsPasswordChangerErrorIdentityVerificationFailure` =
    "tools/password_changer/error/identity_verification_failure"
  case `toolsPasswordChangerSuccess` = "tools/password_changer/success"
  case `notificationPromotionsList` = "notification/promotions/list"
  case `homeOnboardingChecklistTryAutofill` = "home/onboarding_checklist/try_autofill"
  case `autofillTutorialHowToGeneratePasswords` = "autofill/tutorial/how_to_generate_passwords"
  case `antiphishingRedirect` = "antiphishing_redirect"
  case `settingsAddNewDeviceAttemptLimitReached` = "settings/add_new_device/attempt_limit_reached"
  case `itemEmailCreate` = "item/email/create"
  case `sharingCreateItem` = "sharing/create/item"
  case `notificationFollowUpNotificationContent` = "notification/follow_up_notification/content"
  case `itemPasskeyList` = "item/passkey/list"
  case `paywallFamily` = "paywall/family"
  case `itemCredentialCreate` = "item/credential/create"
  case `tacSettingsAccountRecovery` = "tac/settings/account_recovery"
  case `importDashEnterDashPassword` = "import/dash/enter_dash_password"
  case `joinDashlaneTeamVerifyEmailAddress` = "join_dashlane_team/verify_email_address"
  case `autofillNotificationLoginUpdated` = "autofill/notification/login_updated"
  case `tacIntegrationsSplunk` = "tac/integrations/splunk"
  case `autofillNotificationAuthenticatePasskeyUserVerificationMasterPassword` =
    "autofill/notification/authenticate/passkey/user_verification/master_password"
  case `paywallDeviceSyncLimitUnlinkDevice` = "paywall/device_sync_limit/unlink_device"
  case `collectionList` = "collection/list"
  case `authenticatorAppAddAccountTokenHowToLogInAccountHelp` =
    "authenticator_app/add_account_token/how_to_log_in_account/help"
  case `settingsSecurityRecoveryKeyConfirm` = "settings/security/recovery_key/confirm"
  case `itemFiscalStatementDetails` = "item/fiscal_statement/details"
  case `itemBankStatementCreate` = "item/bank_statement/create"
  case `itemDriverLicence` = "item/driver_licence"
  case `passwordHistoryAll` = "password_history/all"
  case `tacAccountBillingInfo` = "tac/account/billing_info"
  case `tools`
  case `homePasswords` = "home/passwords"
  case `autofillNotificationWarningGeneratePasswordDashlaneAccountEmail` =
    "autofill/notification/warning/generate_password_dashlane_account_email"
  case `autofillNotificationAutofillIsDisabled` = "autofill/notification/autofill_is_disabled"
  case `itemCreditCardDetails` = "item/credit_card/details"
  case `notificationSecurityList` = "notification/security/list"
  case `settingsSecurityTwoFactorAuthenticationEnableQrCode` =
    "settings/security/two_factor_authentication/enable/qr_code"
  case `tacUser` = "tac/user"
  case `autofillAccessibility` = "autofill/accessibility"
  case `paywallPasswordLimit` = "paywall/password_limit"
  case `freeTrialStarted` = "free_trial_started"
  case `tacAccountCustomizeInvoice` = "tac/account/customize_invoice"
  case `homeIds` = "home/ids"
  case `paywallDeviceSyncLimit` = "paywall/device_sync_limit"
  case `itemAllList` = "item/all/list"
  case `loginMasterPasswordAccountRecoverySuccess` =
    "login/master_password/account_recovery_success"
  case `paywallFrozenAccount` = "paywall/frozen_account"
  case `tacSubmitAnOrder` = "tac/submit_an_order"
  case `navigationRevampAnnouncementNewBottomActions` =
    "navigation_revamp_announcement/new_bottom_actions"
  case `autofillDropdownAddPhone` = "autofill/dropdown/add_phone"
  case `settingsSecurityProtectWithMasterPasswordIds` =
    "settings/security/protect_with_master_password_ids"
  case `itemCreditCard` = "item/credit_card"
  case `homePersonalInfo` = "home/personal_info"
  case `settingsSecurityProtectWithMasterPasswordCredentialsEnable` =
    "settings/security/protect_with_master_password_credentials/enable"
  case `itemCredentialDetails` = "item/credential/details"
  case `authenticatorAppIntroBackupWithPwm` = "authenticator_app/intro_backup_with_pwm"
  case `sharingList` = "sharing/list"
  case `currentPlan` = "current_plan"
  case `sharing`
  case `toolsAuthenticatorExplore` = "tools/authenticator/explore"
  case `sharingGroupMemberList` = "sharing/group/member/list"
  case `autofillDropdownAddIdCard` = "autofill/dropdown/add_id_card"
  case `itemPaymentList` = "item/payment/list"
  case `settings`
  public var isPriority: Bool {
    switch self {
    case .toolsNewDevice, .onboardingTrustScreens, .loginEmail, .unlockBiometric,
      .accountCreationCreateAccount, .accountCreationTermsServices, .unlockMp, .unlockPin,
      .accountCreationEmail, .onboarding, .loginToken, .accountCreationCreateMasterPassword,
      .loginTokenAuthenticator, .loginTokenEmail:
      return true
    default: return false
    }
  }
}
