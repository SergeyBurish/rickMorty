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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final homeBloc = context.read<HomeBloc>();
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8
            && !homeBloc.state.inProgress) { //  && homeBloc.state.nextUrl != null
        homeBloc.add(GetMoreCharactersEvent());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('characters'.tr()),
            backgroundColor: context.colorScheme.appBarBackground,
            actions: [
              TextButton(
                onPressed: () => context.router.push(const FavoritesRoute()),
                child: Text('favorites'.tr()),
              ),
            ],
          ),
          body: CharactersView(
            characters: state.characters,
            loading: state.inProgress,
            scrollController: _scrollController,
            onUpdate: () => context.read<HomeBloc>().add(GetMoreCharactersEvent()),
          ),
        );
      },
    );
  }
}
