import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/dm.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../domain/entity/character.dart';

class CharactersView extends StatelessWidget {
  final List<Character> characters;
  final void Function()? onUpdate;
  const CharactersView({
    super.key,
    required this.characters,
    this.onUpdate, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dm.s10,
      children: [
        const SizedBox.shrink(),
        ElevatedButton(
          onPressed: onUpdate, 
          child: Text(
            'update'.tr(),
            style: context.textStyles.buttonText,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => Text(
              characters[index].name,
              textAlign: TextAlign.center,
              style: context.textStyles.characterText,
            ),
            separatorBuilder:(_, _) => const SizedBox(height: Dm.s10),
            itemCount: characters.length,
          ),
        )
      ],
    );
  }
}