import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color bg = Color(0xFF0A0A0F);
  static const Color bg2 = Color(0xFF111118);
  static const Color bg3 = Color(0xFF1A1A26);
  static const Color accent = Color(0xFF7C6AF7);
  static const Color accent2 = Color(0xFFA78BFA);
  static const Color accent3 = Color(0xFFC4B5FD);
  static const Color teal = Color(0xFF2DD4BF);
  static const Color teal2 = Color(0xFF5EEAD4);
  static const Color textPrimary = Color(0xFFF1F0FF);
  static const Color textSecondary = Color(0xFFA9A6C8);
  static const Color textTertiary = Color(0xFF6B68A0);
  static const Color cardBorder = Color(0x2E7C6AF7);
  static const Color cardBg = Color(0xD91A1A26);
  static const Color gold = Color(0xFFFAC675);

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(
          primary: accent,
          secondary: teal,
          surface: bg2,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(color: textSecondary),
            bodyLarge: TextStyle(color: textPrimary),
          ),
        ).apply(bodyColor: textSecondary, displayColor: textPrimary),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xB30A0A0F),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          iconTheme: IconThemeData(color: textPrimary),
        ),
      );

  static TextStyle syneStyle({
    double size = 16,
    FontWeight weight = FontWeight.w700,
    Color color = textPrimary,
    double? letterSpacing,
  }) =>
      GoogleFonts.syne(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
      );

  static TextStyle dmStyle({
    double size = 14,
    FontWeight weight = FontWeight.w400,
    Color color = textSecondary,
    double? height,
  }) =>
      GoogleFonts.dmSans(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      );
}
