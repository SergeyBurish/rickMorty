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
  final Set<int> favoriteIds;
  final String? nextUrl;

  HomeState._({
    required this.status,
    required this.characters,
    required this.favoriteIds,
    this.nextUrl,
  });

  HomeState.initial() :
    status = HomeStatus.idle,
    characters = [],
    favoriteIds = {},
    nextUrl = null;

  bool get inProgress => status == HomeStatus.inProgress;
  List<Character> get favorites => characters.where(
        (e) => favoriteIds.contains(e.id)).toList();
}
