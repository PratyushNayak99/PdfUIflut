enum DarkMode { auto, light, dark }

class UserProfile {
  final String name;
  final String email;
  final String initials;
  final bool notifications;
  final DarkMode darkMode;

  UserProfile({
    required this.name,
    required this.email,
    required this.initials,
    this.notifications = true,
    this.darkMode = DarkMode.auto,
  });

  UserProfile copyWith({
    String? name,
    String? email,
    String? initials,
    bool? notifications,
    DarkMode? darkMode,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      initials: initials ?? this.initials,
      notifications: notifications ?? this.notifications,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  String get darkModeDisplayName {
    switch (darkMode) {
      case DarkMode.auto:
        return 'Auto';
      case DarkMode.light:
        return 'Light';
      case DarkMode.dark:
        return 'Dark';
    }
  }
}
