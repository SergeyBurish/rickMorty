import 'package:flutter/material.dart';

import '../../../../core/app_config.dart';

class SettingsEntity {
  final ThemeMode themeMode;
  final AppLocale locale;

  SettingsEntity({required this.themeMode, required this.locale});
}