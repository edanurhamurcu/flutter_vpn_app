import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_app/core/extensions/localization_extensions.dart';

import '../../../../core/components/custom_app_header.dart';
import '../../../../core/components/time_formatter.dart';
import '../../../../data/models/connection_status.dart';

Widget disconnectHeader(BuildContext context, ConnectionStatus? stats) {
  final theme = Theme.of(context);

  return CustomAppHeader(
    child: Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          stats?.connectedCountry?.name != null
              ? AppLocalizations.of(context)!.connected
              : AppLocalizations.of(context)!.disconnected,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Text(
          formatDuration(stats?.connectedTime ?? Duration.zero),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        Text(
          stats?.connectedCountry?.name.localizedCountry(context) ?? '',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        if (stats?.connectedCountry?.city != null)
          Text(
            stats?.connectedCountry?.city.localizedCity(context) ?? '',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
      ],
    ),
  );
}
