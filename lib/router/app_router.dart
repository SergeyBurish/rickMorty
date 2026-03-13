import 'package:auto_route/auto_route.dart';

import '../features/home/presentation/screens/characters/screen.dart';
import '../features/home/presentation/screens/favorites/screen.dart';
import '../features/settings/presentation/settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: CharactersRoute.page,
    ),
    AutoRoute(
      page: FavoritesRoute.page,
    ),
    AutoRoute(
      page: SettingsRoute.page,
    ),
  ];
}