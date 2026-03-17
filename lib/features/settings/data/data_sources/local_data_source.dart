import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto/settings_dto.dart';

abstract interface class SettingsLocalDataSource {
  Future<SettingsDto?> getSettings();
  Future<void> setSettings(SettingsDto settingsDto);
}

class SettingsLocalDataSourceImp implements SettingsLocalDataSource{
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  static const String _key = 'rick_morty_settings_key';

  @override
  Future<SettingsDto?> getSettings() async {
    final json = await asyncPrefs.getString(_key);
    return json == null ? null : SettingsDto.fromJson(jsonDecode(json)); 
  }
  
  @override
  Future<void> setSettings(SettingsDto settingsDto) => 
    asyncPrefs.setString(_key, jsonEncode(settingsDto.toJson()));
}