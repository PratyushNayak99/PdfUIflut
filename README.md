# PDF to Audio Reader - Flutter App

A Flutter application that converts PDF documents to audio with a beautiful mobile-first UI.

## Features

- **Home Screen**: Upload PDFs and access recent files
- **Audio Player**: Full-featured player with play/pause, skip controls, speed adjustment, and bookmarks
- **Library**: Manage all your converted PDF files
- **Settings**: Profile management, notifications, dark mode, storage info
- **Help & FAQ**: Expandable FAQ sections
- **Processing Screen**: Animated conversion screen

## Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Android Studio / VS Code with Flutter extensions
- Android SDK (for APK build)

### Installation

1. Navigate to the project folder:
```bash
cd "PDF to Audio Reader App"
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run on emulator or device:
```bash
flutter run
```

### Build APK

For development APK:
```bash
flutter build apk --debug
```

For release APK:
```bash
flutter build apk --release
```

The APK will be located at:
```
build/app/outputs/flutter-apk/app-release.apk
```

### Build App Bundle (for Play Store)

```bash
flutter build appbundle --release
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── pdf_file.dart         # File data model
│   └── user_profile.dart     # User settings model
├── providers/
│   ├── files_provider.dart   # File management state
│   └── user_provider.dart    # User settings state
├── screens/
│   ├── home_screen.dart      # Home screen
│   ├── player_screen.dart    # Audio player
│   ├── library_screen.dart   # File library
│   ├── settings_screen.dart  # Settings & profile
│   ├── help_screen.dart      # FAQ
│   └── processing_screen.dart # Conversion animation
├── components/
│   ├── phone_frame.dart      # Phone frame wrapper
│   ├── file_item.dart        # File list item
│   ├── waveform_progress.dart # Audio waveform
│   ├── custom_dialog.dart    # Reusable dialogs
│   └── edit_profile_modal.dart # Profile edit modal
└── theme/
    └── app_theme.dart        # Theme configuration
```

## APK Configuration

### Android Permissions

The app requires the following permissions (configured in `android/app/src/main/AndroidManifest.xml`):

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

### Minimum SDK Version

- Minimum: Android 5.0 (API 21)
- Target: Latest Android version

### App Icon & Splash

To generate app icons and splash screens:

1. Add your icon image to `assets/icon/app_icon.png` (1024x1024)
2. Run:
```bash
flutter pub run flutter_launcher_icons
flutter pub run flutter_native_splash:create
```

## State Management

The app uses Provider for state management:

- **FilesProvider**: Manages PDF file list, add/delete operations
- **UserProvider**: Manages user profile, notifications, dark mode settings

## Navigation

Navigation is handled by GoRouter with the following routes:

- `/` - Home screen
- `/player` - Audio player
- `/library` - File library
- `/settings` - Settings
- `/help` - Help & FAQ
- `/processing` - Processing animation

## Customization

### Theme Colors

Edit `lib/theme/app_theme.dart` to customize:

- Primary color
- Background colors (light/dark)
- Surface colors
- Text colors

### App Name

Update in:
- `pubspec.yaml` (name field)
- `android/app/src/main/AndroidManifest.xml` (label)
- `ios/Runner/Info.plist` (CFBundleName)

## Troubleshooting

### Build Issues

1. Clean build:
```bash
flutter clean
flutter pub get
flutter build apk
```

2. Check Flutter doctor:
```bash
flutter doctor
```

### Emulator Issues

- Ensure emulator has enough RAM (2GB minimum)
- Use a device with API 21 or higher
- Enable hardware acceleration

## License

MIT License
