import 'package:dart_either/dart_either.dart';

import '../entity/characters_page.dart';


abstract interface class HomeRepository{
    Future<Either<Exception, CharactersPage>> getCharacters(String? nextUrl);
}
