import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

Widget infoCard(
  BuildContext context,
  String title,
  String value,
  Color color,
  ThemeData theme,
) {
  return Container(
    padding: const EdgeInsets.all(16),
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
        title == AppLocalizations.of(context)!.download
            ? SvgPicture.asset(
              'assets/icons/download.svg',
              width: 30,
              height: 30,
            )
            : SvgPicture.asset(
              'assets/icons/upload.svg',
              width: 30,
              height: 30,
            ),
        Column(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}
