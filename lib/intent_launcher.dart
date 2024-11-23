import 'package:intent_launcher/src/activity_action.dart';
import 'package:intent_launcher/src/intent_launcher_platform_interface.dart';

export 'src/activity_action.dart';

Future<IntentLauncherResult> startActivityAsync(
  String action, {
  IntentLauncherParams params = const IntentLauncherParams(),
}) {
  return IntentLauncherPlatform.instance.startActivity(
    action: action,
    params: params,
  );
}
