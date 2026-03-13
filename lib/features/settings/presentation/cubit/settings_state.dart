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
  final ThemeType themeType;

  SettingsState({
    required this.status,
    required this.themeType,
  });

  SettingsState._({
    required this.status,
    required this.themeType,
  });

  SettingsState.initial() :
    status = SettingsStatus.idle,
    themeType = ThemeType.system;
}
