import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intent_launcher/src/activity_action.dart';

import 'intent_launcher_platform_interface.dart';

/// An implementation of [IntentLauncherPlatform] that uses method channels.
class MethodChannelIntentLauncher extends IntentLauncherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('intent_launcher');

  @override
  Future<IntentLauncherResult> startActivity({
    required String action,
    IntentLauncherParams params = const IntentLauncherParams(),
  }) async {
    final result = await methodChannel.invokeMethod<Map<dynamic, dynamic>>(
      'startActivity',
      {
        'activityAction': action,
        'params': params.toMap(),
      },
    );

    if (result == null) {
      throw Exception('Failed to start activity');
    }

    return IntentLauncherResult.fromMap(result.cast<String, dynamic>());
  }
}
