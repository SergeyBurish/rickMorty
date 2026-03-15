import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class CharacterCard extends StatelessWidget {
  final String name;
  final bool isFavorite;
  final void Function()? onFavoriteTap;
  const CharacterCard({
    super.key,
    required this.name,
    this.onFavoriteTap, required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: context.textStyles.characterText,
        ),
        IconButton(
          onPressed: onFavoriteTap,
          icon: isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border),
        ),
      ],
    );
  }
}