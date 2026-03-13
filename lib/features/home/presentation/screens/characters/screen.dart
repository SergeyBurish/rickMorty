import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../router/app_router.dart';
import '../../../domain/entity/character.dart';
import '../../bloc/home_bloc.dart';
import 'view.dart';

@RoutePage()
class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeUpdateEvent());
  }

  @override
  Widget build(BuildContext context) {
    final List<Character> characters = context.watch<HomeBloc>().state.characters;
    return Scaffold(
      appBar: AppBar(
        title: Text('characters'.tr()),
        backgroundColor: context.colorScheme.appBarBackground,
        actions: [
          TextButton(
            onPressed: () => context.router.push(const FavoritesRoute()), 
            child: Text('favorites'.tr())
          ),
        ],
      ),
      body: CharactersView(
        characters: characters,
        onUpdate: () => context.read<HomeBloc>().add(HomeUpdateEvent()),
      ),
    );
  }
}
