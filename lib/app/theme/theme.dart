import 'package:flutter/material.dart';
import 'package:rephub/app/theme/palette.dart';
import 'package:rephub/app/theme/typography.dart';

class AppTheme {
  AppTheme._();

  static final dark = ThemeData(
    useMaterial3: true,
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppPalette.white,
      displayColor: AppPalette.white,
    ),
    scaffoldBackgroundColor: AppPalette.black,
    primaryColor: AppPalette.primary,
    dividerColor: AppPalette.grey,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.light,
      primary: AppPalette.primary,
      onPrimary: AppPalette.white,
      secondary: AppPalette.secondary,
      error: Colors.red,
      tertiary: AppPalette.darkBG,
      onTertiary: AppPalette.white,
      surfaceContainer: AppPalette.black,
    ),
    iconTheme: const IconThemeData(color: AppPalette.white),
  );

  static final light = ThemeData(
    useMaterial3: true,
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppPalette.black,
      displayColor: AppPalette.black,
    ),
    scaffoldBackgroundColor: AppPalette.white,
    primaryColor: AppPalette.primary,
    dividerColor: AppPalette.grey,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
      primary: AppPalette.primary,
      onPrimary: AppPalette.black,
      secondary: AppPalette.secondary,
      error: Colors.red,
      tertiary: AppPalette.lightBG,
      onTertiary: AppPalette.black,
      surfaceContainer: AppPalette.white,
      primaryFixed: AppPalette.lightBG,
    ),
    iconTheme: const IconThemeData(color: AppPalette.black),
  );
}
