# intent_launcher

A Flutter plugin that provides a simple way to launch Android system settings and other activities through Intents. This package allows you to easily open various Android system settings screens and handle activity results from your Flutter application.

This package was inspired by and based on the excellent work done by Expo team with their [expo-intent-launcher](https://docs.expo.dev/versions/latest/sdk/intent-launcher/) package. 

## Features

- Launch Android system settings screens (WiFi, Bluetooth, Location, etc.)
- Open specific Android activities with custom parameters
- Handle activity launch results
- Support for intent extras, flags, and categories
- Rich set of predefined activity actions
- Type-safe API with strong Flutter integration

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
|---------|-----|-------|-----|--------|----------|
| ✅      | ❌   | ❌     | ❌   | ❌      | ❌        |

## Installation

run

```bash
flutter pub add intent_launcher
```

## Usage

### Basic Usage

```dart
// Open Location settings
await startActivityAsync(ActivityAction.locationSourceSettings);
```

## API Reference

### `startActivityAsync`

Launches an Android activity and returns the result.

```dart
Future<IntentLauncherResult> startActivityAsync(
  String action, {
  IntentLauncherParams params = const IntentLauncherParams(),
})
```

### `IntentLauncherParams`

Configuration options for launching an activity.

```dart
class IntentLauncherParams {
  final String? type;        // MIME type
  final String? category;    // Intent category
  final Map<String, dynamic>? extra;  // Extra key-value pairs
  final String? data;        // URI data
  final int? flags;          // Intent flags
  final String? packageName; // Target package name
}
```

### `IntentLauncherResult`

Contains the result of an activity launch.

```dart
class IntentLauncherResult {
  ResultCode? resultCode;  // Success, canceled, or first user
  String? data;           // Result data URI
  Map<String, dynamic>? extra;  // Result extras
}
```

### Common Activity Actions

The package provides a comprehensive set of predefined activity actions, including:

- `ActivityAction.settings` - Open system settings
- `ActivityAction.wifiSettings` - Open WiFi settings
- `ActivityAction.bluetoothSettings` - Open Bluetooth settings
- `ActivityAction.airplaneModeSettings` - Open airplane mode settings
- `ActivityAction.securitySettings` - Open security settings
- `ActivityAction.locationSourceSettings` - Open location settings
- `ActivityAction.displaySettings` - Open display settings
- `ActivityAction.dateSettings` - Open date & time settings
- `ActivityAction.soundSettings` - Open sound settings
- `ActivityAction.privacySettings` - Open privacy settings
- And many more...

## License

This project is licensed under the MIT License - see the LICENSE file for details.