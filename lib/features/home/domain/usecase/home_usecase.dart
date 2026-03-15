import 'package:dart_either/dart_either.dart';

import '../entity/characters_page.dart';
import '../entity/favorites.dart';
import '../repository/home_repository.dart';

abstract interface class HomeUsecase{
    Future<Either<Exception, CharactersPage>> getCharacters(String? nextUrl);
    Future<Either<Exception, Favorites>> getFavorites();
    Future<Either<Exception, Favorites>> toggleFavorite(int id, Set<int> favoriteIds);
}

class HomeUsecaseImp implements HomeUsecase{
  final HomeRepository repository;

  HomeUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, CharactersPage>> getCharacters(String? nextUrl) => 
      repository.getCharacters(nextUrl);

  @override
  Future<Either<Exception, Favorites>> getFavorites() => repository.getFavorites();
      
  @override
  Future<Either<Exception, Favorites>> toggleFavorite(int id, Set<int> favoriteIds) async {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }

    final Favorites favorites = Favorites(favoriteIds: favoriteIds);
    final output = await repository.saveFavorites(favorites);
    if (output.isRight) {
      return Right(favorites);
    }

    return Left(Exception('fail to save Favorites'));
  }
}
