import 'package:intent_launcher/src/activity_action.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'intent_launcher_method_channel.dart';

abstract class IntentLauncherPlatform extends PlatformInterface {
  /// Constructs a IntentLauncherPlatform.
  IntentLauncherPlatform() : super(token: _token);

  static final Object _token = Object();

  static IntentLauncherPlatform _instance = MethodChannelIntentLauncher();

  /// The default instance of [IntentLauncherPlatform] to use.
  ///
  /// Defaults to [MethodChannelIntentLauncher].
  static IntentLauncherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IntentLauncherPlatform] when
  /// they register themselves.
  static set instance(IntentLauncherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Starts the specified activity asynchronously.
  ///
  /// This method launches an activity based on the given [activityAction] and optional [params].
  /// It returns a [Future] that completes with an [IntentLauncherResult] when the user returns
  /// to the app. The [activityAction] specifies the action to be performed, such as opening
  /// specific settings, and [params] can be used to provide additional intent parameters.
  ///
  /// Throws an [UnimplementedError] if the method has not been implemented.
  Future<IntentLauncherResult> startActivity({
    required String action,
    IntentLauncherParams params = const IntentLauncherParams(),
  }) {
    throw UnimplementedError('startActivity has not been implemented.');
  }
}
