import 'models/connection_status.dart';
import 'models/country.dart';

final mockCountries = [
  Country(
    name: 'Italy',
    countryCode: 'it',
    flag: 'assets/flags/it.png',
    city: '',
    locationCount: 4,
    strength: 70,
    isConnected: false,
  ),
  Country(
    name: 'Netherlands',
    countryCode: 'nl',
    flag: 'assets/flags/nl.png',
    city: 'Amsterdam',
    locationCount: 12,
    strength: 85,
    isConnected: true,
  ),
  Country(
    name: 'Germany',
    countryCode: 'de',
    flag: 'assets/flags/de.png',
    city: '',
    locationCount: 10,
    strength: 90,
    isConnected: false,
  ),
];

final mockConnectionStats = ConnectionStatus(
  downloadSpeed: 527,
  uploadSpeed: 49,
  connectedTime: Duration(hours: 2, minutes: 41, seconds: 52),
  connectedCountry: mockCountries[1], // Netherlands
);
