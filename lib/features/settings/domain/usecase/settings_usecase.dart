import 'package:dart_either/dart_either.dart';

import '../entity/serrings_entity.dart';
import '../repository/settings_repository.dart';

abstract interface class SettingsUsecase{
    Future<Either<Exception, SettingsEntity>> getSettings();
    Future<Either<Exception, void>> setSettings(SettingsEntity settingsEntity);
}
class SettingsUsecaseImp implements SettingsUsecase{
  final SettingsRepository repository;

  SettingsUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, SettingsEntity>> getSettings() => repository.getSettings();
  
  @override
  Future<Either<Exception, void>> setSettings(SettingsEntity settingsEntity) {
    return repository.setSettings(settingsEntity);
  }
}