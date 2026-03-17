import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto/characters_page_dto.dart';
import '../dto/favorites_dto.dart';

abstract interface class HomeLocalDataSource {
  Future<FavoritesDto?> getFavorites();
  Future<void> saveFavorites(FavoritesDto favorites);

  Future<CharactersPageDto?> getCharactersPage();
  Future<void> saveCharactersPage(CharactersPageDto charactersPage);
}

class HomeLocalDataSourceImp implements HomeLocalDataSource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  static const String _favoritesKey = 'rick_morty_favorites_key';
  static const String _charactersPageKey = 'rick_morty_characters_page_key';

  @override
  Future<FavoritesDto?> getFavorites() async {
    final json = await asyncPrefs.getString(_favoritesKey);
    return json == null ? null : FavoritesDto.fromJson(jsonDecode(json));
  }

  @override
  Future<void> saveFavorites(FavoritesDto favorites) => 
      asyncPrefs.setString(_favoritesKey, jsonEncode(favorites.toJson()));
  
  @override
  Future<CharactersPageDto?> getCharactersPage() async {
    final json = await asyncPrefs.getString(_charactersPageKey);
    return json == null ? null : CharactersPageDto.fromJson(jsonDecode(json));
  }

  @override
  Future<void> saveCharactersPage(CharactersPageDto charactersPage) =>
      asyncPrefs.setString(_charactersPageKey, jsonEncode(charactersPage.toJson()));
}