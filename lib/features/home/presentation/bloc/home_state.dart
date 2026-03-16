part of 'home_bloc.dart';

enum HomeStatus {
  idle,
  inProgress,
  success,
  error,
}

enum FavoritesSort {
  none,
  asc,
  des,
}

@CopyWith(constructor: '_')
class HomeState {
  final HomeStatus status;
  final List<Character> characters;
  final Set<int> favoriteIds;
  final FavoritesSort favoritesSort;
  final String? nextUrl;

  HomeState._({
    required this.status,
    required this.characters,
    required this.favoriteIds,
    required this.favoritesSort,
    this.nextUrl,
  });

  HomeState.initial() :
    status = HomeStatus.idle,
    characters = [],
    favoriteIds = {},
    favoritesSort = FavoritesSort.none,
    nextUrl = null;

  bool get inProgress => status == HomeStatus.inProgress;
  bool get favoritesIsNotEmpty => favoriteIds.isNotEmpty;
  bool get favoritesSortedAsc => favoritesSort == FavoritesSort.asc;
  bool get favoritesSortedDes => favoritesSort == FavoritesSort.des;

  List<Character> get favorites {
    final favorites = characters.where(
        (e) => favoriteIds.contains(e.id)).toList();

    return switch (favoritesSort) {
      FavoritesSort.none => favorites,
      FavoritesSort.asc => favorites ..sort((a, b) => a.name.compareTo(b.name)),
      FavoritesSort.des => favorites ..sort((a, b) => b.name.compareTo(a.name)),
    };
  }
}
