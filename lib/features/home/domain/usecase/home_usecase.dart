import 'package:dart_either/dart_either.dart';

import '../entity/characters_page.dart';
import '../repository/home_repository.dart';

abstract interface class HomeUsecase{
    Future<Either<Exception, CharactersPage>> getCharacters();
}

class HomeUsecaseImp implements HomeUsecase{
  final HomeRepository repository;

  HomeUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, CharactersPage>> getCharacters() => 
      repository.getCharacters();
}
