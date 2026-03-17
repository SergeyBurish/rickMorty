import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bloc.dart';
import '../../widgets/characters_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return CharactersList(
          characters: state.favorites,
          favoriteIds: state.favoriteIds,
          loading: state.inProgress,
          onFavoriteTap: (id) => context.read<HomeBloc>().add(FavoriteTapEvent(id: id)),
        );
      },
    );
  }
}