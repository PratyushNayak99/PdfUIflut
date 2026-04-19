import 'package:flutter/foundation.dart';
import '../models/user_profile.dart';

class UserProvider with ChangeNotifier {
  UserProfile _user = UserProfile(
    name: 'Pratyush',
    email: 'pratyush@email.com',
    initials: 'PR',
    notifications: true,
    darkMode: DarkMode.auto,
  );

  UserProfile get user => _user;

  void updateProfile({String? name, String? email}) {
    final initials = (name ?? _user.name)
        .split(' ')
        .map((n) => n[0])
        .join('')
        .toUpperCase()
        .substring(0, 2);
    
    _user = _user.copyWith(
      name: name,
      email: email,
      initials: initials,
    );
    notifyListeners();
  }

  void toggleNotifications() {
    _user = _user.copyWith(notifications: !_user.notifications);
    notifyListeners();
  }

  void cycleDarkMode() {
    DarkMode nextMode;
    switch (_user.darkMode) {
      case DarkMode.auto:
        nextMode = DarkMode.light;
        break;
      case DarkMode.light:
        nextMode = DarkMode.dark;
        break;
      case DarkMode.dark:
        nextMode = DarkMode.auto;
        break;
    }
    _user = _user.copyWith(darkMode: nextMode);
    notifyListeners();
  }

  void setDarkMode(DarkMode mode) {
    _user = _user.copyWith(darkMode: mode);
    notifyListeners();
  }
}
