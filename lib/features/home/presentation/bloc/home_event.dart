part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class _CharactersInitEvent extends HomeEvent {}

class GetMoreCharactersEvent extends HomeEvent {}

class FavoriteTapEvent extends HomeEvent {
  final int id;
  FavoriteTapEvent({required this.id});
}

class FavoriteSortEvent extends HomeEvent {
  final FavoritesSort favoritesSort;
  FavoriteSortEvent({required this.favoritesSort});
}
