part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class _CharactersInitEvent extends HomeEvent {}

class GetMoreCharactersEvent extends HomeEvent {}
