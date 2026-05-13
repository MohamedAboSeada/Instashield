import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static final _baseTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      brightness: .dark,
      seedColor: Colors.teal,
    ),
  );

  static final appTheme = _baseTheme.copyWith(
    textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(_baseTheme.textTheme),
    inputDecorationTheme: _inputTheme,
  );

  static final _inputTheme = InputDecorationThemeData(
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderRadius: .circular(12.0),
      borderSide: BorderSide(
        color: _baseTheme.colorScheme.outline.withValues(alpha: 0.2),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: .circular(12.0),
      borderSide: BorderSide(color: _baseTheme.colorScheme.primary, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: .circular(12.0),
      borderSide: BorderSide(color: _baseTheme.colorScheme.error, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: .circular(12.0),
      borderSide: BorderSide(color: _baseTheme.colorScheme.error, width: 2.0),
    ),
    filled: true,
    fillColor: const ColorScheme.dark().surfaceContainerHighest,
  );
}
