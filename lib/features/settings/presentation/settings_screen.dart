import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_config.dart';
import '../../../core/theme/app_theme.dart';
import 'cubit/settings_cubit.dart';
import 'settings_view.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final settingsCubit = context.read<SettingsCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text('settings'.tr()),
            backgroundColor: context.colorScheme.appBarBackground,
          ),
          body: SettingsView(
            appLocale: state.appLocale,
            themeMode: state.themeMode,
            onLanguageChanged: (appLocale) {
              if (appLocale != null) {
                // TODO: fix issue: https://github.com/aissat/easy_localization/issues/640
                settingsCubit.onLanguageChanged(appLocale);

                // temp solution:
                if (appLocale == AppLocale.system) {
                  context.resetLocale();
                } else {
                  context.setLocale(appLocale.locale);
                } 
              }
            },
            onThemeChanged: settingsCubit.onThemeChanged,
          ),
        );
      },
    );
  }
}
