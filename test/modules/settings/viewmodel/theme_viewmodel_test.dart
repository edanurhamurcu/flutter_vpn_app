import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_app/core/theme/app_theme.dart';
import 'package:vpn_app/modules/settings/viewmodel/theme_viewmodel.dart';

void main() {
  group('ThemeViewModel Tests', () {
    late ThemeViewModel viewModel;

    setUp(() async {
      SharedPreferences.setMockInitialValues({}); //her test için temizle
      viewModel = ThemeViewModel();
      await Future.delayed(const Duration(milliseconds: 10)); 
    });

    test('Başlangıçta light theme yüklenmeli', () {
      expect(viewModel.state, equals(AppTheme.lightTheme));
    });

    test('toggleTheme çağrıldığında light ↔ dark değişmeli', () async {
      // Light -> Dark
      await viewModel.toggleTheme();
      expect(viewModel.state, equals(AppTheme.darkTheme));

      // Dark -> Light
      await viewModel.toggleTheme();
      expect(viewModel.state, equals(AppTheme.lightTheme));
    });

    test('loadTheme doğru temayı yüklemeli (light)', () async {
      SharedPreferences.setMockInitialValues({'isDark': false});
      await viewModel.loadTheme();
      expect(viewModel.state, equals(AppTheme.lightTheme));
    });

    test('loadTheme doğru temayı yüklemeli (dark)', () async {
      SharedPreferences.setMockInitialValues({'isDark': true});
      await viewModel.loadTheme();
      expect(viewModel.state, equals(AppTheme.darkTheme));
    });

    test('_saveTheme tema durumunu kaydetmeli', () async {
      // Light -> Dark
      await viewModel.toggleTheme();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('isDark'), true);

      // Dark -> Light
      await viewModel.toggleTheme();
      expect(prefs.getBool('isDark'), false);
    });

  //Test: Dark tema geçişi ve kaydetme
    test('Tüm akış: toggle → save → load', () async {
      await viewModel.toggleTheme();
      
      final newViewModel = ThemeViewModel();
      await newViewModel.loadTheme();
      
      expect(newViewModel.state, equals(AppTheme.darkTheme));
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('isDark'), true);
    });
  });
}