import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_app/core/components/time_formatter.dart';
import 'package:vpn_app/core/extensions/localization_extensions.dart';
import 'package:vpn_app/modules/home/view/components/active_connection_card.dart';
import 'package:vpn_app/modules/home/view/components/info_card.dart';

import '../../../../data/models/connection_status.dart';

Widget buildConnectionInfo(
  BuildContext context,
  ConnectionStatus? connectionStats,
) {
  final theme = Theme.of(context);

  if (connectionStats == null) {
    return Column(
      spacing: 4,
      children: [
        Text(AppLocalizations.of(context)!.connecting_time),
        Text(
          '00 : 00 : 00',
          style: theme.textTheme.titleLarge?.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56.0),
          child: Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              infoCard(
                context,
                AppLocalizations.of(context)!.download,
                "0 MB",
                Colors.green,
                theme,
              ),
              infoCard(
                context,
                AppLocalizations.of(context)!.upload,
                "0 MB",
                Colors.red,
                theme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  return Column(
    spacing: 4,
    children: [
      Text(AppLocalizations.of(context)!.connecting_time),
      Text(
        formatDuration(connectionStats.connectedTime),
        style: theme.textTheme.titleLarge?.copyWith(fontSize: 32),
      ),
      const SizedBox(height: 16),
      activeConnectionCard(
        context,
        connectionStats.connectedCountry!.name.localizedCountry(context),
        connectionStats.connectedCountry!.city.localizedCity(context),
        connectionStats.connectedCountry!.flag,
        connectionStats.connectedCountry!.strength,
        theme,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 8),
        child: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            infoCard(
              context,
              AppLocalizations.of(context)!.download,
              '${connectionStats.downloadSpeed} MB',
              Colors.green,
              theme,
            ),
            infoCard(
              context,
              AppLocalizations.of(context)!.upload,
              '${connectionStats.uploadSpeed} MB',
              Colors.red,
              theme,
            ),
          ],
        ),
      ),
    ],
  );
}
