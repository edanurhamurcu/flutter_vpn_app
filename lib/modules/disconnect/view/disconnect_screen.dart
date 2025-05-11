// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_app/core/components/custom_snackbar.dart';
import 'package:vpn_app/data/models/connection_status.dart';
import 'package:vpn_app/modules/home/viewModel/home_viewmodel.dart';

import '../../../data/models/country.dart';
import 'components/disconnet_header.dart';

class DisconnectScreen extends ConsumerStatefulWidget {
  const DisconnectScreen({super.key});

  @override
  ConsumerState<DisconnectScreen> createState() => _DisconnectScreenState();
}

class _DisconnectScreenState extends ConsumerState<DisconnectScreen> {
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    final status = ref.read(homeViewModel).connectionStats;
    _isAnimating = status != null;
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModel);
    final status = homeState.connectionStats;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          disconnectHeader(context, status),
          Expanded(
            child:
                _isAnimating
                    ? _buildAnimationArea(context, status)
                    : _buildServerSuggestionList(context, homeState.countries),
          ),
          if (status != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/download.svg',
                        width: 40,
                        height: 40,
                      ),
                      Column(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${status.downloadSpeed} Mbps',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            AppLocalizations.of(context)!.dwld,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 8,
                    children: [
                      Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${status.uploadSpeed} Mbps',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            AppLocalizations.of(context)!.upld,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/upload.svg',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAnimationArea(BuildContext context, ConnectionStatus? stats) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset(
          'assets/animations/connection_animation.json',
          width: 400,
          height: 400,
          fit: BoxFit.cover,
          animate: _isAnimating,
        ),
        IconButton(
          icon: const Icon(
            Icons.power_settings_new,
            size: 48,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() => _isAnimating = false);
            ref.read(homeViewModel.notifier).disconnect();
            CustomSnackbar.showSuccess(
              context,
              AppLocalizations.of(context)!.success_disconnected,
            );
          },
        ),
      ],
    );
  }

  Widget _buildServerSuggestionList(
    BuildContext context,
    List<Country> allCountries,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allCountries.length,
              itemBuilder: (ctx, i) {
                final country = allCountries[i];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Image.asset(country.flag, width: 36, height: 36),
                    title: Text(country.name, style: theme.textTheme.bodyLarge),
                    subtitle: Text(
                      AppLocalizations.of(
                        context,
                      )!.locations(country.locationCount.toString()),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        CustomSnackbar.showInfo(
                          context,
                          AppLocalizations.of(context)!.connecting,
                        );
                        setState(() {
                          _isAnimating = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          ref
                              .read(homeViewModel.notifier)
                              .connectToCountry(country);
                          CustomSnackbar.showSuccess(
                            context,
                            AppLocalizations.of(context)!.success_connected,
                          );
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/connect.svg',
                        width: 48,
                        height: 48,
                        colorFilter: ColorFilter.mode(
                          theme.iconTheme.color!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
