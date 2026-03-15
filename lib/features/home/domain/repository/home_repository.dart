import 'package:dart_either/dart_either.dart';

import '../entity/characters_page.dart';
import '../entity/favorites.dart';


abstract interface class HomeRepository{
    Future<Either<Exception, CharactersPage>> getCharacters(String? nextUrl);
    Future<Either<Exception, Favorites>> getFavorites();
    Future<Either<Exception, void>> saveFavorites(Favorites favorites);
}
