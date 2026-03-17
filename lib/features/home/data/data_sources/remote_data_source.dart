import 'package:dio/dio.dart';

import '../dto/characters_page_dto.dart';


abstract interface class HomeRemoteDataSource {
  Future<CharactersPageDto?> getCharacters(String? nextUrl);
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  static const _baseUrl = 'https://rickandmortyapi.com/api';
  final Dio _dio = Dio();

  @override
  Future<CharactersPageDto?> getCharacters(String? nextUrl) async {
    final response = await _dio.get(nextUrl ?? '$_baseUrl/character');
    if (response.statusCode != null && response.statusCode! ~/ 100 == 2) {
      return CharactersPageDto.fromJson(response.data);
    }
    return null;
  }
}