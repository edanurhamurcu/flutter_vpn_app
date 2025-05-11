import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_app/core/extensions/localization_extensions.dart';
import 'package:vpn_app/data/models/country.dart';
import 'package:vpn_app/modules/home/view/components/country_flag.dart';

Widget locationTile(
  BuildContext context,
  Country country,
  String locations,
  String flagPath, {
  required bool isConnected,
  required VoidCallback onTap,
  required ThemeData theme,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        spacing: 8,
        children: [
          buildCountryFlag(country),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country.name.localizedCountry(context),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(locations),
              ],
            ),
          ),
          isConnected
              ? SvgPicture.asset('assets/icons/connected.svg')
              : SvgPicture.asset(
                'assets/icons/connect.svg',
                colorFilter: ColorFilter.mode(
                  theme.iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/more.svg',
              colorFilter: ColorFilter.mode(
                theme.iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
