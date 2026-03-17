import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/app_config.dart';
import '../../../core/dm.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils.dart';

class SettingsView extends StatelessWidget {
  final AppLocale appLocale;
  final ThemeMode themeMode;
  final void Function(AppLocale?) onLanguageChanged;
  final void Function(ThemeMode?) onThemeChanged;
  const SettingsView({
    super.key,
    required this.appLocale,
    required this.themeMode,
    required this.onLanguageChanged,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textStyles = context.textStyles;
    return ColoredBox(
      color: colorScheme.appBackground,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Dm.maxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dm.s10),
            child: Column(
              spacing: Dm.s10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField<AppLocale>(
                  decoration: InputDecoration(
                    labelText: 'select_language'.tr(),
                    labelStyle: textStyles.dropdownText,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.dropdownBorderEnabled),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.dropdownBorderFocused),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  initialValue: appLocale,
                  items: [AppLocale.system, AppLocale.en, AppLocale.ru].map((AppLocale value) {
                    return DropdownMenuItem<AppLocale>(
                      value: value, 
                      child: Text(Utils.appLocaleToString(value))
                    );
                  }).toList(),
                  onChanged: onLanguageChanged,
                ),
                DropdownButtonFormField<ThemeMode>(
                  decoration: InputDecoration(
                    labelText: 'select_theme'.tr(),
                    labelStyle: textStyles.dropdownText,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.dropdownBorderEnabled),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.dropdownBorderFocused),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  initialValue: themeMode,
                  items: [ThemeMode.system, ThemeMode.light, ThemeMode.dark].map((ThemeMode value) {
                    return DropdownMenuItem<ThemeMode>(
                      value: value, 
                      child: Text(Utils.themeModeToString(value)),
                    );
                  }).toList(),
                  onChanged: onThemeChanged,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}