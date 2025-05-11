import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/modules/home/view/components/connection_info.dart';
import 'package:vpn_app/modules/home/view/components/country_list.dart';
import 'package:vpn_app/modules/home/view/components/free_location_header.dart';
import 'package:vpn_app/modules/home/view/components/home_header.dart';
import 'package:vpn_app/modules/home/viewModel/home_viewmodel.dart';

class CountriesPage extends ConsumerWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModel);
    final connectionStats = homeState.connectionStats;
    final countries = homeState.countries;
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        spacing: 16,
        children: [
          buildHeader(context, ref),
          buildConnectionInfo(context, connectionStats),
          buildFreeLocationsHeader(context, countries.length, theme),
          buildCountryList(context, countries, ref, theme),
        ],
      ),
    );
  }
}
