import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto/favorites_dto.dart';

abstract interface class HomeLocalDataSource {
  Future<FavoritesDto?> getFavorites();
  Future<void> saveFavorites(FavoritesDto favorites);
}

class HomeLocalDataSourceImp implements HomeLocalDataSource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  static const String _key = 'rick_morty_favorites_key';

  @override
  Future<FavoritesDto?> getFavorites() async {
    final json = await asyncPrefs.getString(_key);
    return json == null ? null : FavoritesDto.fromJson(jsonDecode(json));
  }

  @override
  Future<void> saveFavorites(FavoritesDto favorites) => asyncPrefs.setString(_key, jsonEncode(favorites.toJson()));
}