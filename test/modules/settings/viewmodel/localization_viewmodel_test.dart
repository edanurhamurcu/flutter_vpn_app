import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_app/modules/settings/viewmodel/localization_viewmodel.dart';

void main() {
  group('LocaleViewModel Tests', () {
    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      container = ProviderContainer();
      await Future.delayed(const Duration(milliseconds: 10)); 
    });

    tearDown(() async {
      container.dispose();
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    });


    test('Riverpod Provider üzerinden dil değiştirme', () async {
      final notifier = container.read(localeViewModel.notifier);
      await Future.delayed(const Duration(milliseconds: 10)); 

      await notifier.setLocale(const Locale('tr'));
      
      expect(container.read(localeViewModel), const Locale('tr'));
      
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('selected_locale'), 'tr');
    });
  });
}