import 'dart:convert';

import '../features/home/data/data_sources/remote_data_source.dart';
import '../features/home/data/dto/characters_page_dto.dart';

class MockDataSource implements HomeRemoteDataSource {
  static const int _pageLength = 20;

    @override
  Future<CharactersPageDto> getCharacters(String? nextUrl) async {
    final mockJson = switch (nextUrl) {
      null =>    _pageMock(start:  1,                  next: '"page2"'),
      'page2' => _pageMock(start: _pageLength + 1,     next: '"page3"'),
      'page3' => _pageMock(start: _pageLength * 2 + 1, next: '"page4"'),
      'page4' => _pageMock(start: _pageLength * 3 + 1),
      _ => ''
    };
    return CharactersPageDto.fromJson(json.decode(mockJson));
  }

  static String _pageMock({required int start, String? next}) {
    final List<int> ids = List.generate(_pageLength, (i) => i+start);
    final List<String> caractersList = ids.map((i) => _caracterMock(i)).toList();
    final String caracters = caractersList.join(',');

    return '''
{
${_infoMock(next)},
"results":[
$caracters
]
}
''';
  }

  static String _infoMock(String? next) {
    return '''
"info":{
  "count":826,
  "pages":3,
  "next":${next ?? 'null'},
  "prev":null
}
''';
  }

  static String _caracterMock(int id) {
    return '''
  {
    "id":$id,
    "name":"NameID$id",
    "status":"${id%7 == 0 ? 'Dead' : 'Alive'}",
    "species":"${id%8 == 0 ? 'Alien' : 'Human'}"
  }
''';
  }
}