part of 'home_bloc.dart';

enum HomeStatus {
  idle,
  inProgress,
  success,
  error,
}

@CopyWith(constructor: '_')
class HomeState {
  final HomeStatus status;
  final List<Character> characters;

  HomeState._({
    required this.status,
    required this.characters,
  });

  HomeState.initial() :
    status = HomeStatus.idle,
    characters = [];
}
