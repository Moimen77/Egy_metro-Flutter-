// core/theme/app_theme.dart
import 'package:egypt_metro_navigator/core/theme/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: EgyptColors.red,
          brightness: Brightness.light,
        ).copyWith(
          primary: EgyptColors.red,
          onPrimary: EgyptColors.white,
          primaryContainer: const Color(0xFFFFE3E6),
          onPrimaryContainer: EgyptColors.red,
          secondary: EgyptColors.gold,
          onSecondary: EgyptColors.white,
          surface: EgyptColors.cream,
          onSurface: EgyptColors.black,
          surfaceContainerHighest: const Color(0xFFF1EADB),
          outline: const Color(0xFFB8AE98),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: EgyptColors.cream,
      fontFamily: GoogleFonts.cairo().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: EgyptColors.black,
        foregroundColor: EgyptColors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: EgyptColors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: EgyptColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE0D8C6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE0D8C6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: EgyptColors.red, width: 2),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: EgyptColors.red,
      ),
    );
  }
}
