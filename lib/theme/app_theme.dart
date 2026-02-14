import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF0F0F0), // Light gray background
    primaryColor: const Color(0xFFFFA500), // Orange
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFA500),
      // Aincrad uses a lots of orange, yellow, white transparency.
      primary: const Color(0xFFFFA500),
      secondary: const Color(0xFFFFD700), // Gold/Yellow
      surface: Colors.white.withValues(alpha: 0.9),
    ),
    textTheme: GoogleFonts.outfitTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: const CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ), // Slightly angular for tech feel
        side: BorderSide(color: Color(0xFFFFA500), width: 0.5),
      ),
    ),
  );
}
