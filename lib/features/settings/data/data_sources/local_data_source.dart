import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto/settings_dto.dart';

abstract interface class SettingsLocalDataSource {
  Future<SettingsDto?> getSettings();
}

class SettingsLocalDataSourceImp implements SettingsLocalDataSource{
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  static const String _key = 'rick_morty_settings_key';

  @override
  Future<SettingsDto?> getSettings() async {
    final json = await asyncPrefs.getString(_key);
    return json == null ? null : SettingsDto.fromJson(jsonDecode(json)); 
  }
}