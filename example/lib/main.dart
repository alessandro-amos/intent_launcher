import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intent Launcher Example'),
        ),
        body: const IntentLauncherTest(),
      ),
    );
  }
}

class IntentLauncherTest extends StatelessWidget {
  const IntentLauncherTest({super.key});

  Future<void> _startActivityAsync({
    required BuildContext context,
    required String action,
    IntentLauncherParams params = const IntentLauncherParams(),
  }) async {
    final result = await startActivityAsync(
      action,
      params: params,
    );

    if (!context.mounted) return;
    debugPrint(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _startActivityAsync(
                context: context,
                action: ActivityAction.wirelessSettings,
                params: const IntentLauncherParams(),
              );
            },
            child: const Text('Wireless Settings'),
          ),
          ElevatedButton(
            onPressed: () {
              _startActivityAsync(
                context: context,
                action: ActivityAction.settings,
                params: const IntentLauncherParams(),
              );
            },
            child: const Text('Settings'),
          ),
          ElevatedButton(
            onPressed: () {
              _startActivityAsync(
                context: context,
                action: ActivityAction.applicationDetailsSettings,
                params: const IntentLauncherParams(
                  data: 'package:com.android.vending',
                ),
              );
            },
            child: const Text('Application Details for Play Store'),
          ),
          ElevatedButton(
            onPressed: () {
              _startActivityAsync(
                context: context,
                action: ActivityAction.applicationDetailsSettings,
                params: const IntentLauncherParams(
                  data: 'package:package.name.that.doesnt.exist',
                ),
              );
            },
            child: const Text('Application Details for not existing package'),
          ),
          ElevatedButton(
            onPressed: () {
              _startActivityAsync(
                context: context,
                action: 'android.media.action.IMAGE_CAPTURE',
                params: const IntentLauncherParams(
                  flags: 100,
                ),
              );
            },
            child: const Text('Camera'),
          ),
        ],
      ),
    );
  }
}
