import 'package:intent_launcher/src/activity_action.dart';
import 'package:intent_launcher/src/intent_launcher_platform_interface.dart';

export 'src/activity_action.dart';

/// Starts the specified activity. The method will return a Future which resolves when the user
/// returns to the app.
///
/// The [action] parameter specifies the action to be performed, e.g.
/// [ActivityAction.wirelessSettings].
/// There are a few pre-defined constants you can use for this parameter.
/// You can find them at [https://github.com/alessandro-amos/intent_launcher/blob/master/lib/src/activity_action.dart](https://github.com/alessandro-amos/intent_launcher/blob/master/lib/src/activity_action.dart#L1).
///
/// The [params] parameter is an object of intent parameters.
///
/// The method returns a Future which fulfils with an [IntentLauncherResult] object.
Future<IntentLauncherResult> startActivityAsync(
  String action, {
  IntentLauncherParams params = const IntentLauncherParams(),
}) {
  return IntentLauncherPlatform.instance.startActivity(
    action: action,
    params: params,
  );
}
