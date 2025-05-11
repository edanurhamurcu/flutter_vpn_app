// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_app/core/theme/app_colors.dart';
import 'package:vpn_app/modules/disconnect/view/disconnect_screen.dart';
import 'package:vpn_app/modules/settings/view/setting_screen.dart';

import 'countries.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CountriesPage(),
    DisconnectScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Expanded(child: _pages[_currentIndex])]),

      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          elevation: 2,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/map.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0 ? AppColors.primary : AppColors.mediumGray,
                  BlendMode.srcIn,
                ),
              ),
              label: AppLocalizations.of(context)!.countries,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/radar.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1 ? AppColors.primary : AppColors.mediumGray,
                  BlendMode.srcIn,
                ),
              ),
              label: AppLocalizations.of(context)!.disconnect,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/setting.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2 ? AppColors.primary : AppColors.mediumGray,
                  BlendMode.srcIn,
                ),
              ),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
