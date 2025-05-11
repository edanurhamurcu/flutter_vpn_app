import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_app/core/components/custom_icon_btn.dart';
import 'package:vpn_app/core/theme/app_colors.dart';
import 'package:vpn_app/modules/home/view/search_country.dart';
import 'package:vpn_app/modules/home/viewModel/home_viewmodel.dart';

Widget buildHeader(BuildContext context, WidgetRef ref) {
  final theme = Theme.of(context);

  return Container(
    padding: const EdgeInsets.all(16.0),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.27,
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage('assets/images/header_bg.png'),
        fit: BoxFit.cover,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(36),
        bottomRight: Radius.circular(36),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconButton('assets/icons/category.svg', theme),
              Text(
                AppLocalizations.of(context)!.countries,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
              iconButton('assets/icons/crown.svg', theme),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color:
                  theme.brightness == Brightness.light
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              focusNode: FocusNode(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const SearchResultsPage(searchQuery: ''),
                  ),
                );
              },
              onChanged: (value) {
                ref.read(homeViewModel.notifier).searchCountry(value, context);
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search_country,
                hintStyle: TextStyle(
                  color:
                      theme.brightness == Brightness.light
                          ? Colors.black.withValues(alpha: 0.5)
                          : Colors.white.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
                suffixIcon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    theme.iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
