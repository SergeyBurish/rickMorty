import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'di/injector.dart';
import 'di/locator.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';
import 'router/app_router.dart';

final AppRouter router = AppRouter();

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'l10n',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc(homeUsecase: Locator.homeUsecase)),
        BlocProvider(create: (context) => SettingsCubit(settingsUsecase: Locator.settingsUsecase)),
      ],
      child: MaterialApp.router(
        title: 'title'.tr(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.createLightTheme(),
        darkTheme: AppTheme.createDarkTheme(),
        routerConfig: router.config(),
      ),
    );
  }
}
