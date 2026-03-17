// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsDto _$SettingsDtoFromJson(Map<String, dynamic> json) => SettingsDto(
  themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
  locale: $enumDecode(_$AppLocaleEnumMap, json['locale']),
);

Map<String, dynamic> _$SettingsDtoToJson(SettingsDto instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'locale': _$AppLocaleEnumMap[instance.locale]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$AppLocaleEnumMap = {
  AppLocale.system: 'system',
  AppLocale.en: 'en',
  AppLocale.ru: 'ru',
};
