import 'dart:convert';

import '../features/home/data/data_sources/remote_data_source.dart';
import '../features/home/data/dto/characters_page_dto.dart';

class MockDataSource implements HomeRemoteDataSource {

    static const String mockJson = '''
{
"info":{
  "count":826,
  "pages":42,
  "next":"https://rickandmortyapi.com/api/character?page=2",
  "prev":null
  },
"results":[
  {
    "name":"Rick Sanchez",
    "status":"Alive",
    "species":"Human"
  },
  {
    "name":"Morty Smith",
    "status":"Alive",
    "species":"Human"
  }
]}''';

  @override
  Future<CharactersPageDto> getCharacters() async => 
      CharactersPageDto.fromJson(json.decode(mockJson));
}