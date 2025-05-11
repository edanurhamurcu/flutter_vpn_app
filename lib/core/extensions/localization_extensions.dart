import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension CountryLocalizationExtension on String {
  /// Ülke adını lokalize eder. Eğer çeviri yoksa orijinalini döner.
  String localizedCountry(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    switch (toLowerCase()) {
      case 'germany':
        return localizations?.germany ?? this;
      case 'italy':
        return localizations?.italy ?? this;
      case 'netherlands':
        return localizations?.netherlands ?? this;
      // Gerekirse diğer ülkeleri ekleyebilirsin
      default:
        return this;
    }
  }

  String localizedCity(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    switch (toLowerCase()) {
      case 'berlin':
        return localizations?.berlin ?? this;
      case 'rome':
        return localizations?.roma ?? this;
      case 'amsterdam':
        return localizations?.amsterdam ?? this;
      // Gerekirse diğer şehirleri ekleyebilirsin
      default:
        return this;
    }
  }
}