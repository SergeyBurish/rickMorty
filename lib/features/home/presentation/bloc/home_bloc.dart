import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/character.dart';
import '../../domain/entity/characters_page.dart';
import '../../domain/entity/favorites.dart';
import '../../domain/usecase/home_usecase.dart';

part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase homeUsecase;
  HomeBloc({required this.homeUsecase})
      : super(HomeState.initial()) {

    on<_CharactersInitEvent>((event, emit) async {
      await _getNextCharacters(emit);

      emit(state.copyWith.status(HomeStatus.inProgress));
      final output = await homeUsecase.getFavorites();
      output.fold(
        ifLeft: (_) => emit(state.copyWith.status(HomeStatus.error)),
        ifRight: (Favorites favorites) {
          emit(state.copyWith(
            status: HomeStatus.success,
            favoriteIds: favorites.favoriteIds,
          ));
        }
      );
    });

    on<GetMoreCharactersEvent>((event, emit) async {
      if (state.nextUrl != null) {
        await _getNextCharacters(emit);
      }
    });

    on<FavoriteTapEvent>((event, emit) async {
      emit(state.copyWith.status(HomeStatus.inProgress));

      final output = await homeUsecase.toggleFavorite(event.id, state.favoriteIds);
      output.fold(
        ifLeft: (_) => emit(state.copyWith.status(HomeStatus.error)),
        ifRight: (Favorites favorites) {
          emit(state.copyWith(
            status: HomeStatus.success,
            favoriteIds: favorites.favoriteIds,
          ));
        }
      );
    });

    on<FavoriteSortEvent>((event, emit) async {
      emit(state.copyWith.status(HomeStatus.inProgress));

      emit(state.copyWith(
        status: HomeStatus.success,
        favoritesSort: event.favoritesSort,
      ));
    });

    add(_CharactersInitEvent());
  }

  Future<void> _getNextCharacters (Emitter<HomeState> emit) async {
    emit(state.copyWith.status(HomeStatus.inProgress));

    final output = await homeUsecase.getCharacters(state.nextUrl);
    output.fold(
      ifLeft: (_) => emit(state.copyWith.status(HomeStatus.idle)),
      ifRight: (CharactersPage charactersPage) async {
        emit(state.copyWith(
          status: HomeStatus.success,
          characters: [
            ...state.characters, 
            ...charactersPage.characters],
          nextUrl: charactersPage.info.next,
        ));

        final CharactersPage charactersPageCache = CharactersPage(
          info: charactersPage.info,
          characters: [...state.characters]
        );

        await homeUsecase.setToCache(charactersPageCache);
      }
    );

    if (output.isLeft) {
      await _tryGetCharactersFromCache(emit);
    }
  }

  Future<void> _tryGetCharactersFromCache (Emitter<HomeState> emit) async {
    emit(state.copyWith.status(HomeStatus.inProgress));
    final output = await homeUsecase.getFromCache();

    output.fold(
      ifLeft: (_) => emit(state.copyWith.status(HomeStatus.error)),
      ifRight: (CharactersPage charactersPage) async {
        emit(state.copyWith(
          status: HomeStatus.success,
          characters: [...charactersPage.characters],
          nextUrl: charactersPage.info.next,
        ));
      }
    );
  }
}
