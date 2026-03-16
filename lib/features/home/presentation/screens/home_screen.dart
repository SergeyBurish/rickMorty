import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dm.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../router/app_router.dart';
import '../bloc/home_bloc.dart';
import 'characters/screen.dart';
import 'favorites/screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;
  final List<Widget> _screens = [
    const CharactersScreen(),
    const FavoritesScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavigationBarTap(int index) {
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut
      );
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    final bool favoriteIsNotEmpty = context.watch<HomeBloc>().state.favoritesIsNotEmpty;
    final bool favoritesSortedAsc = context.watch<HomeBloc>().state.favoritesSortedAsc;
    final bool favoritesSortedDes = context.watch<HomeBloc>().state.favoritesSortedDes;
    final bool showSortIcone = favoriteIsNotEmpty && (favoritesSortedAsc || favoritesSortedDes);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? 'characters'.tr() : 'favorites'.tr()
        ),
        backgroundColor: context.colorScheme.appBarBackground,
        actions: [
          if(_currentIndex != 0 && showSortIcone) AnimatedRotation(
            turns: favoritesSortedAsc ? 0.5 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(Icons.sort),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: context.colorScheme.appBackground,
              ),
              child: const SizedBox.shrink()
            ),
            ListTile(
              title: Text('settings'.tr()),
              onTap: () => context.router.push(const SettingsRoute()),
            ),
            if(_currentIndex != 0 && favoriteIsNotEmpty) ...[
              ListTile(
                title: const Text('sort none'),
                onTap: () => homeBloc.add(FavoriteSortEvent(favoritesSort: FavoritesSort.none)),
              ),
              ListTile(
                title: const Text('sort ascending'),
                onTap: () => homeBloc.add(FavoriteSortEvent(favoritesSort: FavoritesSort.asc)),
              ),
              ListTile(
                title: const Text('sort descending'),
                onTap: () => homeBloc.add(FavoriteSortEvent(favoritesSort: FavoritesSort.des)),
              )
            ],
          ],
        ),
      ),
      body: ColoredBox(
        color: context.colorScheme.appBackground,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Dm.maxWidth),
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _screens,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavigationBarTap,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: 'characters'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: 'favorites'.tr(),
          ),
        ],
      ),
    );
  }
}
