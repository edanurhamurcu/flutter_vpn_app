import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_app/core/theme/app_theme.dart';

final themeVM = StateNotifierProvider<ThemeViewModel, ThemeData>((ref) {
  return ThemeViewModel();
});

class ThemeViewModel extends StateNotifier<ThemeData> {
  ThemeViewModel() : super(AppTheme.lightTheme) {
    loadTheme();
  }

  Future<void> toggleTheme() async {
    state =
        state == AppTheme.lightTheme ? AppTheme.darkTheme : AppTheme.lightTheme;
    await _saveTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    state = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', state == AppTheme.darkTheme);
  }
}
