import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/modules/settings/viewmodel/theme_viewmodel.dart';

import '../viewmodel/localization_viewmodel.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(themeVM.notifier);
    final isDarkTheme = ref.watch(themeVM).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(color: Colors.white),
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/header_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            secondary: Icon(
              isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: isDarkTheme ? theme.iconTheme.color : Colors.amber,
            ),
            title: Text(
              AppLocalizations.of(context)!.theme,
              style: theme.textTheme.bodyLarge,
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.switch_theme,
              style: theme.textTheme.bodyMedium,
            ),
            value: isDarkTheme,
            onChanged: (value) => vm.toggleTheme(),
          ),

          SwitchListTile(
            secondary: Icon(Icons.notifications, color: theme.iconTheme.color),
            title: Text(
              AppLocalizations.of(context)!.enable_notifications,
              style: theme.textTheme.bodyLarge,
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.receive_notifications,
              style: theme.textTheme.bodyMedium,
            ),
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            leading: Icon(Icons.language, color: theme.iconTheme.color),
            title: Text(
              AppLocalizations.of(context)!.language,
              style: theme.textTheme.bodyLarge,
            ),
            subtitle: Text(
              ref.watch(localeViewModel).languageCode == 'tr'
                  ? AppLocalizations.of(context)!.turkish
                  : AppLocalizations.of(context)!.english,
              style: theme.textTheme.bodyMedium,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: theme.iconTheme.color,
            ),
            onTap: () async {
              final locale = await showModalBottomSheet<Locale>(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.1,
                ),
                context: context,
                builder: (context) {
                  return SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Image.asset(
                            'assets/flags/us.png',
                            width: 40,
                            height: 40,
                          ),
                          title: Text(AppLocalizations.of(context)!.english),

                          onTap:
                              () => Navigator.pop(context, const Locale('en')),
                        ),
                        Divider(),
                        ListTile(
                          leading: Image.asset(
                            'assets/flags/tr.png',
                            width: 40,
                            height: 40,
                          ),
                          title: Text(AppLocalizations.of(context)!.turkish),
                          onTap:
                              () => Navigator.pop(context, const Locale('tr')),
                        ),
                      ],
                    ),
                  );
                },
              );
              if (locale != null) {
                ref.read(localeViewModel.notifier).setLocale(locale);
              }
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.privacy_policy,
              style: theme.textTheme.bodyLarge,
            ),
            leading: Icon(Icons.privacy_tip, color: theme.iconTheme.color),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.terms_of_service,
              style: theme.textTheme.bodyLarge,
            ),
            leading: Icon(Icons.article, color: theme.iconTheme.color),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.about,
              style: theme.textTheme.bodyLarge,
            ),
            leading: Icon(Icons.info, color: theme.iconTheme.color),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
