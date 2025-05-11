import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_app/data/mock_data.dart';
import 'package:vpn_app/modules/home/viewModel/home_viewmodel.dart';

void main() {
  group('HomeViewModel Tests', () {
    late HomeViewModel viewModel;

    setUp(() {
      viewModel = HomeViewModel();
    });

    // Test: ViewModel'in başlangıç durumu
    test('Initial state is correct', () {
      expect(viewModel.state.countries, mockCountries);
      expect(viewModel.state.filteredCountries, mockCountries);
      expect(viewModel.state.connectionStats, mockConnectionStats);
    });

    //Test: Bir ülkeye bağlanma
    test('connectToCountry updates connectionStats correctly', () {
      final countryToConnect = mockCountries[1]; // Netherlands

      viewModel.connectToCountry(countryToConnect);

      expect(
        viewModel.state.connectionStats?.connectedCountry,
        countryToConnect,
      );
      expect(
        viewModel.state.connectionStats?.connectedTime,
        Duration(hours: 2, minutes: 41, seconds: 52),
      );
      expect(viewModel.state.connectionStats?.downloadSpeed, isNotNull);
      expect(viewModel.state.connectionStats?.uploadSpeed, isNotNull);
    });

    // Test: Bağlantıyı kesme
    test('disconnect resets connectionStats to null', () {
      final countryToConnect = mockCountries[1]; // Netherlands
      viewModel.connectToCountry(countryToConnect);

      viewModel.disconnect();

      expect(viewModel.state.connectionStats, isNull);
      expect(viewModel.state.countries.any((c) => c.isConnected), isFalse);
    });

    // Test: Ülke arama
    testWidgets('searchCountry filters countries correctly', (
      WidgetTester tester,
    ) async {
      // Bir MaterialApp oluştur ve WidgetTester ile çalışır
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              // Arama fonksiyonu testi
              final query = 'Italy';

              viewModel.searchCountry(query, context);

              expect(viewModel.state.filteredCountries.length, 1);
              expect(viewModel.state.filteredCountries[0].name, 'Italy');

              return Container(); // Boş bir widget döndürür
            },
          ),
        ),
      );
    });

    testWidgets('searchCountry with empty query resets filteredCountries', (
      WidgetTester tester,
    ) async {
      // Bir MaterialApp oluşturur ve WidgetTester ile çalıştır
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              // Boş arama testi
              viewModel.searchCountry('', context);

              expect(
                viewModel.state.filteredCountries.length,
                mockCountries.length,
              );

              return Container();
            },
          ),
        ),
      );
    });

    // Test: Ülke bağlantı durumu güncelleme
    test('connectToCountry updates connectionStats correctly', () {
      final countryToConnect = mockCountries[1]; // Netherlands

      viewModel.connectToCountry(countryToConnect);

      final connectedCountry =
          viewModel.state.connectionStats?.connectedCountry;

      // Özellik bazlı karşılaştırma
      expect(connectedCountry?.name, countryToConnect.name);
      expect(connectedCountry?.countryCode, countryToConnect.countryCode);
      expect(connectedCountry?.flag, countryToConnect.flag);
      expect(connectedCountry?.city, countryToConnect.city);
      expect(connectedCountry?.locationCount, countryToConnect.locationCount);
      expect(connectedCountry?.strength, countryToConnect.strength);
      expect(connectedCountry?.isConnected, true);
      expect(
        viewModel.state.connectionStats?.connectedTime,
        Duration(hours: 2, minutes: 41, seconds: 52),
      );
      expect(viewModel.state.connectionStats?.downloadSpeed, isNotNull);
      expect(viewModel.state.connectionStats?.uploadSpeed, isNotNull);
    });

    // Test: Bağlantıyı kesme
    test('disconnect resets connectionStats to null', () {
      final countryToConnect = mockCountries[1]; // Netherlands
      viewModel.connectToCountry(countryToConnect);

      viewModel.disconnect();

      expect(viewModel.state.connectionStats, isNull);
      expect(viewModel.state.countries.any((c) => c.isConnected), isFalse);
    });
  });
}
