import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/dm.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/text_styles.dart';

class CharacterCard extends StatelessWidget {
  final String name;
  final String species;
  final String status;
  final String imageUrl;
  final String? type;
  final bool isFavorite;
  final void Function()? onFavoriteTap;
  const CharacterCard({
    super.key,
    required this.name,
    required this.species,
    required this.status,
    required this.imageUrl,
    this.type,
    required this.isFavorite,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = context.textStyles;
    return Padding(
      padding: const EdgeInsets.all(Dm.s8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [const BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dm.s5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dm.s5,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dm.s8),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectableText (
                        name,
                        style: textStyles.characterText,
                      ),
                    ),
                    IconButton(
                      onPressed: onFavoriteTap,
                      icon: isFavorite 
                        ? Icon(
                            Icons.star,
                            color: context.colorScheme.favoriteStar,
                          ) 
                        : const Icon(Icons.star_border),
                    ),
                  ],
                ),
              ),
              Center(
                child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dm.s8),
                child: Text(
                  '$species, $status',
                  style: textStyles.characterText,
                ),
              ),
              if (type?.isNotEmpty ?? false) Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dm.s8),
                child: Text(
                  type!,
                  style: textStyles.typeText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
