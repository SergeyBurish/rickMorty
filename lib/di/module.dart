import 'package:injectable/injectable.dart';

import '../core/app_config.dart';
import '../features/home/data/data_sources/local_data_source.dart';
import '../features/home/data/data_sources/remote_data_source.dart';
import '../features/home/data/repository/home_repository.dart';
import '../features/home/domain/repository/home_repository.dart';
import '../features/home/domain/usecase/home_usecase.dart';
import '../features/settings/data/data_sources/local_data_source.dart';
import '../features/settings/data/repository/settings_repository.dart';
import '../features/settings/domain/repository/settings_repository.dart';
import '../features/settings/domain/usecase/settings_usecase.dart';
import '../mock/mock_data_source.dart';

@module
abstract class Module {
  @lazySingleton
  SettingsLocalDataSource localDataSource() => SettingsLocalDataSourceImp();

  @lazySingleton
  SettingsRepository settingsRepository(SettingsLocalDataSource localDataSource) =>
      SettingsRepositoryImp(localDataSource: localDataSource);

  @lazySingleton
  SettingsUsecase settingsUsecase(SettingsRepository repository) =>
      SettingsUsecaseImp(repository: repository);



  @lazySingleton
  HomeRemoteDataSource remoteDataSource() => AppConfig.useMockApi ?
      MockDataSource() : HomeRemoteDataSourceImp();

  @lazySingleton
  HomeLocalDataSource homeLocalDataSource() => HomeLocalDataSourceImp();

  @lazySingleton
  HomeRepository homeRepository(
    HomeRemoteDataSource remoteDataSource,
    HomeLocalDataSource homeLocalDataSource,
  ) =>
      HomeRepositoryImp(
        remoteDataSource: remoteDataSource,
        localDataSource: homeLocalDataSource,
      );

  @lazySingleton
  HomeUsecase homeUsecase(HomeRepository repository) =>
      HomeUsecaseImp(repository: repository);
}