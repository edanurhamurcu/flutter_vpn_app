import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

Widget buildFreeLocationsHeader(
  BuildContext context,
  int countryCount,
  ThemeData theme,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.free_locations(countryCount.toString()),
        ),
        SvgPicture.asset(
          'assets/icons/info_circle.svg',
          width: 18,
          height: 18,
          colorFilter: ColorFilter.mode(
            theme.iconTheme.color!,
            BlendMode.srcIn,
          ),
        ),
      ],
    ),
  );
}
