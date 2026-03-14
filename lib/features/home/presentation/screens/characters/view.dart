import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/dm.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../domain/entity/character.dart';

class CharactersView extends StatelessWidget {
  final List<Character> characters;
  final bool loading;
  final ScrollController scrollController;
  final void Function()? onUpdate;
  const CharactersView({
    super.key,
    required this.characters,
    required this.loading,
    required this.scrollController, 
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
            controller: scrollController,
            itemBuilder: (context, index) => index < characters.length 
            ? Text(
              '${characters[index].id} ${characters[index].name}',
              textAlign: TextAlign.center,
              style: context.textStyles.characterText,
            )
            : const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
            separatorBuilder:(_, _) => const SizedBox(height: Dm.s10),
            itemCount: loading ? characters.length + 1 : characters.length,
          ),
        )
      ],
    );
  }
}