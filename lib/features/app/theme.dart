import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    appBarTheme: AppThemes.appBarTheme,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Palette.red,
      primary: Palette.red,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
  static AppBarTheme appBarTheme = const AppBarTheme(backgroundColor: Colors.white);
}
