// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_app/core/components/custom_snackbar.dart';
import 'package:vpn_app/core/extensions/localization_extensions.dart';
import 'package:vpn_app/modules/home/view/components/country_flag.dart';
import 'package:vpn_app/modules/home/viewModel/home_viewmodel.dart';

import '../../../core/components/connection_animation.dart';

class SearchResultsPage extends ConsumerWidget {
  final String searchQuery;

  const SearchResultsPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController(
      text: searchQuery,
    );
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          // Arama Çubuğu
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: searchController,
                      onChanged: (value) {
                        ref
                            .read(homeViewModel.notifier)
                            .searchCountry(value, context);
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.search_country,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          // Arama Sonuçları
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final homeState = ref.watch(homeViewModel);
                final filteredCountries = homeState.filteredCountries;

                if (filteredCountries.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_results,
                      style: theme.textTheme.bodyLarge,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    return ListTile(
                      leading: buildCountryFlag(country),
                      title: Text(country.name.localizedCountry(context)),
                      subtitle: Text(
                        AppLocalizations.of(
                          context,
                        )!.locations(country.locationCount.toString()),
                      ),
                      trailing:
                          country.isConnected
                              ? SvgPicture.asset('assets/icons/connected.svg')
                              : SvgPicture.asset(
                                'assets/icons/connect.svg',
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                ),
                              ),
                      onTap: () async {
                        if (country.isConnected) {
                          ConnectionAnimationOverlay.show(
                            context,
                            child: Text(
                              AppLocalizations.of(context)!.disconnecting,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                          await Future.delayed(const Duration(seconds: 2));

                          ref.read(homeViewModel.notifier).disconnect();
                          ConnectionAnimationOverlay.hide();

                          Navigator.pop(context);

                          CustomSnackbar.showSuccess(
                            context,
                            AppLocalizations.of(context)!.disconnected_from(
                              country.name.localizedCountry(context),
                            ),
                          );
                        } else {
                          ConnectionAnimationOverlay.show(
                            context,
                            child: Text(
                              AppLocalizations.of(context)!.connecting,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );

                          await Future.delayed(const Duration(seconds: 2));

                          ref
                              .read(homeViewModel.notifier)
                              .connectToCountry(country);

                          ConnectionAnimationOverlay.hide();
                          Navigator.pop(context);

                          CustomSnackbar.showSuccess(
                            context,
                            AppLocalizations.of(context)!.connected_to(
                              country.name.localizedCountry(context),
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
