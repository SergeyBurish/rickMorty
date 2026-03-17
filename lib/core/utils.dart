import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_config.dart';

class Utils {
  static String appLocaleToString (AppLocale appLocale) {
    return switch (appLocale) {
      AppLocale.system => 'system'.tr(),
      AppLocale.en => 'english'.tr(),
      AppLocale.ru => 'russian'.tr(),
    };
  }

  static String themeModeToString (ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.system => 'system'.tr(),
      ThemeMode.light => 'light'.tr(),
      ThemeMode.dark => 'dark'.tr(),
    };
  }
}