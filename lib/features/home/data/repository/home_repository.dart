import 'package:dart_either/dart_either.dart';

import '../../domain/entity/characters_page.dart';
import '../../domain/entity/favorites.dart';
import '../../domain/repository/home_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../dto/characters_page_dto.dart';
import '../dto/favorites_dto.dart';

class HomeRepositoryImp implements HomeRepository{
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImp({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Exception, CharactersPage>> getCharacters(String? nextUrl) async {    
    try {
      final CharactersPageDto? response = await remoteDataSource.getCharacters(nextUrl);
      if (response == null) {
        return Left(Exception('fail to get characters'));
      }
      return Right(response.toCharactersPage);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Favorites>> getFavorites() async {
    try {
      final FavoritesDto? response = await localDataSource.getFavorites();
      return Right(response ?? Favorites(favoriteIds: {}));
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> saveFavorites(Favorites favorites) async {
    try {
      await localDataSource.saveFavorites(favorites.toDto);
      return const Right(null);
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}