import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/core/extensions/localization_extensions.dart';
import 'package:vpn_app/utils/helpers/speed_helper.dart';
import 'package:vpn_app/utils/helpers/timer_helper.dart';

import '../../../data/mock_data.dart';
import '../../../data/models/connection_status.dart';
import '../../../data/models/country.dart';

final homeViewModel = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(),
);

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState.initial()) {
    _startTimer();
  }

  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _timer = TimerHelper.startTimer(Duration(seconds: 1), () {
      if (state.connectionStats != null) {
        state = state.copyWith(
          connectionStats: state.connectionStats!.copyWith(
            connectedTime:
                state.connectionStats!.connectedTime + Duration(seconds: 1),
            downloadSpeed: SpeedHelper.generateRandomSpeed(),
            uploadSpeed: SpeedHelper.generateRandomSpeed(),
          ),
        );
      } else {
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  int _generateRandomSpeed() => Random().nextInt(1000);

  List<Country> _updateCountries(String? connectedCountryName) {
    return state.countries.map((country) {
      return country.copyWith(
        isConnected: country.name == connectedCountryName,
      );
    }).toList();
  }

  void connectToCountry(Country country) {
    if (state.connectionStats?.connectedCountry?.name == country.name) {
      return;
    }

    final updatedCountries = _updateCountries(country.name);
    final updatedConnectedCountry = updatedCountries.firstWhere(
      (c) => c.name == country.name,
    );

    state = state.copyWith(
      countries: updatedCountries,
      filteredCountries: updatedCountries,
      connectionStats: ConnectionStatus(
        downloadSpeed: _generateRandomSpeed(),
        uploadSpeed: _generateRandomSpeed(),
        connectedTime: Duration.zero,
        connectedCountry: updatedConnectedCountry,
      ),
    );
    _startTimer();
  }

  void disconnect() {
    _timer?.cancel();

    final updatedCountries = _updateCountries(null);

    state = state.copyWith(
      countries: updatedCountries,
      filteredCountries: updatedCountries,
      connectionStats: null,
    );
  }

void searchCountry(String query, BuildContext context) {
  if (query.isEmpty) {
    state = state.copyWith(filteredCountries: state.countries);
    return;
  }

  final filteredCountries = state.countries.where((country) {
    return country.name.localizedCountry(context).toLowerCase().contains(query.toLowerCase());
  }).toList();

  state = state.copyWith(
    filteredCountries: filteredCountries,
    connectionStats: state.connectionStats,
  );
}

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}

class HomeState {
  final List<Country> countries;
  final List<Country> filteredCountries;
  final ConnectionStatus? connectionStats;

  HomeState({
    required this.countries,
    required this.filteredCountries,
    required this.connectionStats,
  });

  factory HomeState.initial() => HomeState(
    countries: mockCountries,
    filteredCountries: mockCountries,
    connectionStats: mockConnectionStats,
  );

  HomeState copyWith({
    List<Country>? countries,
    List<Country>? filteredCountries,
    ConnectionStatus? connectionStats,
  }) {
    return HomeState(
      countries: countries ?? this.countries,
      filteredCountries: filteredCountries ?? this.filteredCountries,
      connectionStats: connectionStats,
    );
  }
}
