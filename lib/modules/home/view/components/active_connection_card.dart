import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Widget activeConnectionCard(
  BuildContext context,
  String country,
  String city,
  String flagPath,
  int signalStrength,
  ThemeData theme,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 8,
        children: [
          Image.asset(flagPath, width: 40, height: 40),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(city),
              ],
            ),
          ),
          Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(AppLocalizations.of(context)!.stealth),
              Text(
                '$signalStrength%',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
