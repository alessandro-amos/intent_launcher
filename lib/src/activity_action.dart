/// Constants are from the source code of [Settings provider](https://developer.android.com/reference/android/provider/Settings).
abstract class ActivityAction {
  const ActivityAction._();

  String get action;

  static const String accessibilitySettings =
      "android.settings.ACCESSIBILITY_SETTINGS";
  static const String addAccountSettings =
      "android.settings.ADD_ACCOUNT_SETTINGS";
  static const String airplaneModeSettings =
      "android.settings.AIRPLANE_MODE_SETTINGS";
  static const String apnSettings = "android.settings.APN_SETTINGS";
  static const String appNotificationRedaction =
      "android.settings.ACTION_APP_NOTIFICATION_REDACTION";
  static const String appNotificationSettings =
      "android.settings.APP_NOTIFICATION_SETTINGS";
  static const String appOpsSettings = "android.settings.APP_OPS_SETTINGS";
  static const String applicationDetailsSettings =
      "android.settings.APPLICATION_DETAILS_SETTINGS";
  static const String applicationDevelopmentSettings =
      "android.settings.APPLICATION_DEVELOPMENT_SETTINGS";
  static const String applicationSettings =
      "android.settings.APPLICATION_SETTINGS";
  static const String batterySaverSettings =
      "android.settings.BATTERY_SAVER_SETTINGS";
  static const String bluetoothSettings = "android.settings.BLUETOOTH_SETTINGS";
  static const String captioningSettings =
      "android.settings.CAPTIONING_SETTINGS";
  static const String castSettings = "android.settings.CAST_SETTINGS";
  static const String dataRoamingSettings =
      "android.settings.DATA_ROAMING_SETTINGS";
  static const String dateSettings = "android.settings.DATE_SETTINGS";
  static const String deviceInfoSettings =
      "android.settings.DEVICE_INFO_SETTINGS";
  static const String deviceName = "android.settings.DEVICE_NAME";
  static const String displaySettings = "android.settings.DISPLAY_SETTINGS";
  static const String dreamSettings = "android.settings.DREAM_SETTINGS";
  static const String hardKeyboardSettings =
      "android.settings.HARD_KEYBOARD_SETTINGS";
  static const String homeSettings = "android.settings.HOME_SETTINGS";
  static const String ignoreBackgroundDataRestrictionsSettings =
      "android.settings.IGNORE_BACKGROUND_DATA_RESTRICTIONS_SETTINGS";
  static const String ignoreBatteryOptimizationSettings =
      "android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS";
  static const String inputMethodSettings =
      "android.settings.INPUT_METHOD_SETTINGS";
  static const String inputMethodSubtypeSettings =
      "android.settings.INPUT_METHOD_SUBTYPE_SETTINGS";
  static const String internalStorageSettings =
      "android.settings.INTERNAL_STORAGE_SETTINGS";
  static const String localeSettings = "android.settings.LOCALE_SETTINGS";
  static const String locationSourceSettings =
      "android.settings.LOCATION_SOURCE_SETTINGS";
  static const String manageAllApplicationsSettings =
      "android.settings.MANAGE_ALL_APPLICATIONS_SETTINGS";
  static const String manageApplicationsSettings =
      "android.settings.MANAGE_APPLICATIONS_SETTINGS";
  static const String manageDefaultAppsSettings =
      "android.settings.MANAGE_DEFAULT_APPS_SETTINGS";
  static const String memoryCardSettings =
      "android.settings.MEMORY_CARD_SETTINGS";
  static const String networkOperatorSettings =
      "android.settings.NETWORK_OPERATOR_SETTINGS";
  static const String nfcSettings = "android.settings.NFC_SETTINGS";
  static const String nfcPaymentSettings =
      "android.settings.NFC_PAYMENT_SETTINGS";
  static const String nfcSharingSettings =
      "android.settings.NFCSHARING_SETTINGS";
  static const String nightDisplaySettings =
      "android.settings.NIGHT_DISPLAY_SETTINGS";
  static const String notificationPolicyAccessSettings =
      "android.settings.NOTIFICATION_POLICY_ACCESS_SETTINGS";
  static const String notificationSettings =
      "android.settings.NOTIFICATION_SETTINGS";
  static const String pairingSettings = "android.settings.PAIRING_SETTINGS";
  static const String privacySettings = "android.settings.PRIVACY_SETTINGS";
  static const String quickLaunchSettings =
      "android.settings.QUICK_LAUNCH_SETTINGS";
  static const String requestIgnoreBatteryOptimizations =
      "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS";
  static const String securitySettings = "android.settings.SECURITY_SETTINGS";
  static const String settings = "android.settings.SETTINGS";
  static const String showAdminSupportDetails =
      "android.settings.SHOW_ADMIN_SUPPORT_DETAILS";
  static const String showInputMethodPicker =
      "android.settings.SHOW_INPUT_METHOD_PICKER";
  static const String showRegulatoryInfo =
      "android.settings.SHOW_REGULATORY_INFO";
  static const String showRemoteBugReportDialog =
      "android.settings.SHOW_REMOTE_BUGREPORT_DIALOG";
  static const String soundSettings = "android.settings.SOUND_SETTINGS";
  static const String storageManagerSettings =
      "android.settings.STORAGE_MANAGER_SETTINGS";
  static const String syncSettings = "android.settings.SYNC_SETTINGS";
  static const String systemUpdateSettings =
      "android.settings.SYSTEM_UPDATE_SETTINGS";
  static const String tetherProvisioningUi =
      "android.settings.TETHER_PROVISIONING_UI";
  static const String trustedCredentialsUser =
      "android.settings.TRUSTED_CREDENTIALS_USER";
  static const String usageAccessSettings =
      "android.settings.USAGE_ACCESS_SETTINGS";
  static const String userDictionaryInsert =
      "android.settings.USER_DICTIONARY_INSERT";
  static const String userDictionarySettings =
      "android.settings.USER_DICTIONARY_SETTINGS";
  static const String userSettings = "android.settings.USER_SETTINGS";
  static const String voiceControlAirplaneMode =
      "android.settings.VOICE_CONTROL_AIRPLANE_MODE";
  static const String voiceControlBatterySaverMode =
      "android.settings.VOICE_CONTROL_BATTERY_SAVER_MODE";
  static const String voiceControlDoNotDisturbMode =
      "android.settings.VOICE_CONTROL_DO_NOT_DISTURB_MODE";
  static const String voiceInputSettings =
      "android.settings.VOICE_INPUT_SETTINGS";
  static const String vpnSettings = "android.settings.VPN_SETTINGS";
  static const String vrListenerSettings =
      "android.settings.VR_LISTENER_SETTINGS";
  static const String webviewSettings = "android.settings.WEBVIEW_SETTINGS";
  static const String wifiIpSettings = "android.settings.WIFI_IP_SETTINGS";
  static const String wifiSettings = "android.settings.WIFI_SETTINGS";
  static const String wirelessSettings = "android.settings.WIRELESS_SETTINGS";
  static const String zenModeAutomationSettings =
      "android.settings.ZEN_MODE_AUTOMATION_SETTINGS";
  static const String zenModeEventRuleSettings =
      "android.settings.ZEN_MODE_EVENT_RULE_SETTINGS";
  static const String zenModeExternalRuleSettings =
      "android.settings.ZEN_MODE_EXTERNAL_RULE_SETTINGS";
  static const String zenModePrioritySettings =
      "android.settings.ZEN_MODE_PRIORITY_SETTINGS";
  static const String zenModeScheduleRuleSettings =
      "android.settings.ZEN_MODE_SCHEDULE_RULE_SETTINGS";
  static const String zenModeSettings = "android.settings.ZEN_MODE_SETTINGS";
}

class IntentLauncherParams {
  /// A string specifying the MIME type of the data represented by the data parameter. Ignore this
  /// argument to allow Android to infer the correct MIME type.
  final String? type;

  /// Category provides more details about the action the intent performs. See [Intent.addCategory](https://developer.android.com/reference/android/content/Intent.html#addCategory(java.lang.String)).
  final String? category;

  /// A map specifying additional key-value pairs which are passed with the intent as `extras`.
  /// The keys must include a package prefix, for example the app `com.android.contacts` would use
  /// names like `com.android.contacts.ShowAll`.
  final Map<String, dynamic>? extra;

  /// A URI specifying the data that the intent should operate upon. (_Note:_ Android requires the URI
  /// scheme to be lowercase, unlike the formal RFC.)
  final String? data;

  /// Bitmask of flags to be used. See [Intent.setFlags](<https://developer.android.com/reference/android/content/Intent.html#setFlags(int)>) for more details.
  final int? flags;

  /// Package name used as an identifier of ComponentName. Set this only if you want to explicitly
  /// set the component to handle the intent.
  final String? packageName;

  const IntentLauncherParams({
    this.type,
    this.category,
    this.extra,
    this.data,
    this.flags,
    this.packageName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'category': category,
      'extra': extra,
      'data': data,
      'flags': flags,
      'packageName': packageName,
    };
  }
}

enum ResultCode {
  success(-1),
  canceled(0),
  firstUser(1);

  final int value;

  const ResultCode(this.value);

  factory ResultCode.fromValue(int value) {
    return ResultCode.values.firstWhere((element) => element.value == value);
  }
}

class IntentLauncherResult {
  /// Result code returned by the activity.
  ResultCode? resultCode;

  /// Optional data URI that can be returned by the activity.
  String? data;

  /// Optional extras object that can be returned by the activity.
  Map<String, dynamic>? extra;

  IntentLauncherResult({this.resultCode, this.data, this.extra});

  factory IntentLauncherResult.fromMap(Map<String, dynamic> map) {
    return IntentLauncherResult(
      resultCode: ResultCode.fromValue(map['resultCode']),
      data: map['data'],
      extra: (map['extra'] as Map<dynamic, dynamic>?)?.cast<String, dynamic>(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resultCode': resultCode?.value,
      'data': data,
      'extra': extra,
    };
  }

  @override
  String toString() =>
      'IntentLauncherResult(resultCode: $resultCode, data: $data, extra: $extra)';
}
