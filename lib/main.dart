import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'providers/files_provider.dart';
import 'providers/user_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/player_screen.dart';
import 'screens/library_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';
import 'screens/processing_screen.dart';
import 'components/edit_profile_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilesProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          final isDarkMode = _isDarkMode(userProvider.user.darkMode.index);
          
          return MaterialApp.router(
            title: 'PDF Listener',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            routerConfig: _router,
          );
        },
      ),
    );
  }

  bool _isDarkMode(int darkModeIndex) {
    // 0 = auto, 1 = light, 2 = dark
    if (darkModeIndex == 2) return true;
    if (darkModeIndex == 1) return false;
    // Auto mode - use system brightness
    return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/player',
      name: 'player',
      builder: (context, state) => const PlayerScreen(),
    ),
    GoRoute(
      path: '/library',
      name: 'library',
      builder: (context, state) => const LibraryScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/help',
      name: 'help',
      builder: (context, state) => const HelpScreen(),
    ),
    GoRoute(
      path: '/processing',
      name: 'processing',
      builder: (context, state) => const ProcessingScreen(),
    ),
  ],
);

// Extension method to show edit profile modal
extension EditProfileModalExtension on BuildContext {
  Future<void> showEditProfileModal({
    required String name,
    required String email,
    required Function(String, String) onSave,
  }) {
    return showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => EditProfileModal(
        name: name,
        email: email,
        onSave: onSave,
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }
}
