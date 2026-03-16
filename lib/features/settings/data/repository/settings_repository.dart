import 'package:dart_either/dart_either.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_config.dart';
import '../../domain/entity/serrings_entity.dart';
import '../../domain/repository/settings_repository.dart';
import '../data_sources/local_data_source.dart';
import '../dto/settings_dto.dart';

class SettingsRepositoryImp implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImp({required this.localDataSource});

  @override
  Future<Either<Exception, SettingsEntity>> getSettings() async {
    try {
      final SettingsDto? settingsDto = await localDataSource.getSettings();
      return Right(settingsDto ?? SettingsEntity(themeMode: ThemeMode.system, locale: AppLocale.system));
    } on Exception catch (e) {
      return Left(e);
    }
  }
  
  @override
  Future<Either<Exception, void>> setSettings(SettingsEntity settingsEntity) async {
    try {
      await localDataSource.setSettings(settingsEntity.toDto());
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}