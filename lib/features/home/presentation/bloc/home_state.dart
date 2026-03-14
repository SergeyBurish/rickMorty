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
  final String? nextUrl;

  HomeState._({
    required this.status,
    required this.characters,
    this.nextUrl,
  });

  HomeState.initial() :
    status = HomeStatus.idle,
    characters = [],
    nextUrl = null;

  bool get inProgress => status == HomeStatus.inProgress;
}
