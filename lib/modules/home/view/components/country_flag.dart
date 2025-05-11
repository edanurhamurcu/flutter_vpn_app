import 'package:flutter/material.dart';
import 'package:vpn_app/data/models/country.dart';

Widget buildCountryFlag(Country country) {
  if (country.flag.isNotEmpty) {
    return Image.asset(
      country.flag,
      width: 32,
      height: 32,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.flag); 
      },
    );
  }

  return Image.asset(
    'assets/flags/${country.countryCode}.png',
    width: 32,
    height: 32,
    errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.flag); 
    },
  );
}