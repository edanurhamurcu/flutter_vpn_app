
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/core/components/connection_animation.dart';
import 'package:vpn_app/core/components/custom_snackbar.dart';
import 'package:vpn_app/core/extensions/localization_extensions.dart';
import 'package:vpn_app/data/models/country.dart';
import 'package:vpn_app/modules/home/view/components/location_tile.dart';
import 'package:vpn_app/modules/home/viewModel/home_viewmodel.dart';

Widget buildCountryList(
  BuildContext context,
  List<Country> countries,
  WidgetRef ref,
  ThemeData theme,
) {
  return Expanded(
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return locationTile(
          context,
          country,
          AppLocalizations.of(
            context,
          )!.locations(country.locationCount.toString()),
          country.flag,
          isConnected: country.isConnected,
          onTap: () async {
            if (country.isConnected) {
              ConnectionAnimationOverlay.show(
                context,
                child: Text(
                  AppLocalizations.of(context)!.disconnecting,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
              await Future.delayed(const Duration(seconds: 2));

              ref.read(homeViewModel.notifier).disconnect();
              ConnectionAnimationOverlay.hide();

              CustomSnackbar.showSuccess(
                context,
                AppLocalizations.of(context)!.disconnected_from(country.name.localizedCountry(context)),
              );
            } else {
              ConnectionAnimationOverlay.show(
                context,
                child: Text(
                  AppLocalizations.of(context)!.connecting,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );

              await Future.delayed(const Duration(seconds: 2));

              ref.read(homeViewModel.notifier).connectToCountry(country);

              ConnectionAnimationOverlay.hide();

              CustomSnackbar.showSuccess(
                context,
                AppLocalizations.of(context)!.connected_to(country.name.localizedCountry(context)),
              );
            }
          },
          theme: theme,
        );
      },
    ),
  );
}
