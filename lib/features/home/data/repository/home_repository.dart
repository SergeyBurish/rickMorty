import 'package:dart_either/dart_either.dart';

import '../../domain/entity/characters_page.dart';
import '../../domain/repository/home_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../dto/characters_page_dto.dart';

class HomeRepositoryImp implements HomeRepository{
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Exception, CharactersPage>> getCharacters() async {    
    try {
      CharactersPageDto? response = await remoteDataSource.getCharacters();
      if (response == null) {
        return Left(Exception('fail to get characters'));
      }
      return Right(response.toCharactersPage);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}