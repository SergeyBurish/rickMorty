part of 'settings_cubit.dart';

enum SettingsStatus {
  idle,
  inProgress,
  success,
  error,
}

@CopyWith(constructor: '_')
class SettingsState {
  final SettingsStatus status;
  final ThemeMode themeMode;
  final AppLocale appLocale;

  SettingsState._({
    required this.status,
    required this.themeMode,
    required this.appLocale,
  });

  SettingsState.initial() :
    status = SettingsStatus.idle,
    themeMode = ThemeMode.system,
    appLocale = AppLocale.system;
}
