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
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index < characters.length) {
          final character = characters[index];
          final id = character.id;
          return CharacterCard(
            name: '$id ${character.name}',
            species: character.species,
            status: character.status,
            imageUrl: character.image,
            type: character.type,
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
    );
  }
}