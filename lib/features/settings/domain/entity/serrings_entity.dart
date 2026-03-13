enum ThemeType{
  light,
  dark,
  system,
}
class SettingsEntity {
  final ThemeType themeType;

  SettingsEntity({required this.themeType});
}