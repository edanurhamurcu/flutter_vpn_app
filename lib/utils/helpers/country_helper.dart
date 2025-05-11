import '../../data/models/country.dart';

class CountryHelper {
  static List<Country> updateCountries(
      List<Country> countries, String? connectedCountryName) {
    return countries.map((country) {
      return country.copyWith(isConnected: country.name == connectedCountryName);
    }).toList();
  }
}