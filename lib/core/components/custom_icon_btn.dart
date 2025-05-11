  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconButton(String iconPath, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.iconTheme.color?.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(iconPath),
        color: theme.iconTheme.color,
      ),
    );
  }