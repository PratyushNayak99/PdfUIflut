import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Exact colors from React design (Tailwind CSS variables)
  static const Color primary = Color(0xFF5B8DEF);
  static const Color primaryForeground = Color(0xFFE8F0FE);
  static const Color backgroundLight = Color(0xFFF2F2F7);
  static const Color backgroundDark = Colors.black;
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1C1C1E);
  static const Color textPrimaryLight = Color(0xFF1C1C1E);
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryLight = Color(0xFF9CA3AF);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: primaryForeground,
      surface: cardLight,
      background: backgroundLight,
      onPrimary: primaryForeground,
      onSecondary: primary,
      onSurface: textPrimaryLight,
      onBackground: textPrimaryLight,
      surfaceVariant: const Color(0xFFE5E5E5),
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      headlineLarge: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.0,
        height: 1.0,
        color: textPrimaryLight,
      ),
      headlineMedium: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: textPrimaryLight,
      ),
      titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        color: textPrimaryLight,
      ),
      titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: textPrimaryLight,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textPrimaryLight,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textPrimaryLight,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textSecondaryLight,
      ),
      labelSmall: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: textPrimaryLight,
      ),
    ),
    scaffoldBackgroundColor: backgroundLight,
    cardTheme: CardThemeData(
      color: cardLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: primaryForeground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: primary,
      secondary: primaryForeground,
      surface: cardDark,
      background: backgroundDark,
      onPrimary: primaryForeground,
      onSecondary: primary,
      onSurface: textPrimaryDark,
      onBackground: textPrimaryDark,
      surfaceVariant: const Color(0xFF2A2A2E),
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      headlineLarge: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.0,
        height: 1.0,
        color: textPrimaryDark,
      ),
      headlineMedium: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: textPrimaryDark,
      ),
      titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        color: textPrimaryDark,
      ),
      titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: textPrimaryDark,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textPrimaryDark,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textPrimaryDark,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textSecondaryDark,
      ),
      labelSmall: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: textPrimaryDark,
      ),
    ),
    scaffoldBackgroundColor: backgroundDark,
    cardTheme: CardThemeData(
      color: cardDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: primaryForeground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
