import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/dm.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../router/app_router.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? 'characters'.tr() : 'favorites'.tr()
        ),
        backgroundColor: context.colorScheme.appBarBackground,
        actions: [
          TextButton(
            onPressed: () => context.router.push(const SettingsRoute()),
            child: Text('settings'.tr()),
          ),
        ],
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
