import 'package:flutter/material.dart';

import '../../../../core/dm.dart';
import '../../domain/entity/character.dart';
import 'character_card.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;
  final Set<int> favoriteIds;
  final bool loading;
  final ScrollController? scrollController;
  final void Function(int id) onFavoriteTap;
  const CharactersList({
    super.key,
    required this.characters,
    required this.favoriteIds, 
    required this.loading,
    this.scrollController, 
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < characters.length) {
                final id = characters[index].id;
                return CharacterCard(
                  name: '$id ${characters[index].name}',
                  isFavorite: favoriteIds.contains(id),
                  onFavoriteTap: () => onFavoriteTap(id),
                );
              }
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            },
            separatorBuilder:(_, _) => const SizedBox(height: Dm.s10),
            itemCount: loading ? characters.length + 1 : characters.length,
          ),
        )
      ],
    );
  }
}