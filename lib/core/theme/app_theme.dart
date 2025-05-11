import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();
  
  static const String fontFamily = 'Poppins';

  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;


/// The [lightTheme] is a [ThemeData] object that defines the light theme for the app.
/// It includes properties such as font family, color scheme, app bar theme,
/// icon theme, text theme, list tile theme, switch theme, bottom navigation bar theme,
/// and card theme. The colors used in the light theme are defined in the [AppColors] class.
/// The [lightTheme] is used when the app is in light mode.
///
static final _lightTheme = ThemeData(
  fontFamily: AppTheme.fontFamily,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    surface: AppColors.white,
    onSurface: AppColors.mediumGray,
    onPrimary: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.lightBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightBackground,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.mediumGray),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.mediumGray,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: AppColors.mediumGray,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: AppColors.darkGray,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(color: AppColors.mediumGray, fontSize: 12),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.mediumGray,
    textColor: AppColors.darkGray,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(AppColors.primary),
    trackColor: WidgetStatePropertyAll(AppColors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.lightBackground,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.mediumGray,
    elevation: 2,
  ),
  cardTheme: const CardTheme(
    color: AppColors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColors.white, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),

  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.lightBackground,
    elevation: 2,
    contentTextStyle: const TextStyle(
      color: AppColors.mediumGray,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    actionTextColor: AppColors.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      side: BorderSide(color: AppColors.lightBackground, width: 1),
    ),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.lightBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
  ),

  dividerTheme: DividerThemeData(
    color: AppColors.mediumGray.withValues(alpha: 0.2),
    thickness: 1,
    space: 0,
  ),
);

/// The [darkTheme] is a [ThemeData] object that defines the dark theme for the app.
/// It includes properties such as font family, color scheme, app bar theme,
/// icon theme, text theme, list tile theme, switch theme, bottom navigation bar theme,
/// and card theme. The colors used in the dark theme are defined in the [AppColors] class.
/// The [darkTheme] is used when the app is in dark mode.

static final _darkTheme = ThemeData(
  fontFamily: AppTheme.fontFamily,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    surface: Colors.white10,
    onSurface: Colors.white70,
    onPrimary: Colors.black,
  ),
  scaffoldBackgroundColor: AppColors.darkBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    elevation: 2,
    iconTheme: IconThemeData(color: AppColors.primary),
    titleTextStyle: TextStyle(
      color: AppColors.primary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.white),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: Colors.white70,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(color: Colors.white54, fontSize: 12),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.white,
    textColor: AppColors.white,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(AppColors.primary),
    trackColor: WidgetStatePropertyAll(AppColors.mediumGray),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkBackground,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.mediumGray,
    elevation: 2,
  ),
  cardTheme: const CardTheme(
    color: Colors.black45,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColors.darkGray, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),

  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.darkBackground,
    elevation: 2,
    contentTextStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    actionTextColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      side: BorderSide(color: AppColors.darkGray, width: 1),
    ),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.darkBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  ),

  dividerTheme: DividerThemeData(
    color: AppColors.white.withValues(alpha: 0.2),
    thickness: 1,
    space: 0,
  ),
);
}