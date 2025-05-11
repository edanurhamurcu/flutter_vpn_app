import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeViewModel = StateNotifierProvider<LocaleViewModel, Locale>(
  (ref) => LocaleViewModel(),
);

class LocaleViewModel extends StateNotifier<Locale> {
  LocaleViewModel() : super(const Locale('en')) {
    loadLocale();
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await _saveLocale(locale);
  }

  Future<void> _saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_locale', locale.languageCode);
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('selected_locale') ?? 'en';
    state = Locale(languageCode);
  }
}
