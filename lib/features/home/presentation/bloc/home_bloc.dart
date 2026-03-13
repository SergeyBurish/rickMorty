import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/character.dart';
import '../../domain/entity/characters_page.dart';
import '../../domain/usecase/home_usecase.dart';

part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase homeUsecase;
  HomeBloc({required this.homeUsecase})
      : super(HomeState.initial()) {

    on<HomeUpdateEvent>((event, emit) async {
      emit(state.copyWith.status(HomeStatus.inProgress));

      final output = await homeUsecase.getCharacters();
      output.fold(
        ifLeft: (_) => emit(state.copyWith.status(HomeStatus.error)),
        ifRight: (CharactersPage charactersPage) {
          emit(state.copyWith(
            status: HomeStatus.success,
            characters: charactersPage.characters,
          ));
        }
      );
    });
  }
}
