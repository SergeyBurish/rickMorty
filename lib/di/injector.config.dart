// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/home/data/data_sources/local_data_source.dart' as _i401;
import '../features/home/data/data_sources/remote_data_source.dart' as _i985;
import '../features/home/domain/repository/home_repository.dart' as _i855;
import '../features/home/domain/usecase/home_usecase.dart' as _i951;
import '../features/settings/data/data_sources/local_data_source.dart' as _i502;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i816;
import '../features/settings/domain/usecase/settings_usecase.dart' as _i115;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final module = _$Module();
    gh.lazySingleton<_i502.SettingsLocalDataSource>(
      () => module.localDataSource(),
    );
    gh.lazySingleton<_i985.HomeRemoteDataSource>(
      () => module.remoteDataSource(),
    );
    gh.lazySingleton<_i401.HomeLocalDataSource>(
      () => module.homeLocalDataSource(),
    );
    gh.lazySingleton<_i816.SettingsRepository>(
      () => module.settingsRepository(gh<_i502.SettingsLocalDataSource>()),
    );
    gh.lazySingleton<_i115.SettingsUsecase>(
      () => module.settingsUsecase(gh<_i816.SettingsRepository>()),
    );
    gh.lazySingleton<_i855.HomeRepository>(
      () => module.homeRepository(
        gh<_i985.HomeRemoteDataSource>(),
        gh<_i401.HomeLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i951.HomeUsecase>(
      () => module.homeUsecase(gh<_i855.HomeRepository>()),
    );
    return this;
  }
}

class _$Module extends _i946.Module {}
