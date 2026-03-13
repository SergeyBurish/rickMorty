import 'package:dart_either/dart_either.dart';

import '../entity/serrings_entity.dart';
import '../repository/settings_repository.dart';

abstract interface class SettingsUsecase{
    Future<Either<Exception, SettingsEntity>> getSettings();
}
class SettingsUsecaseImp implements SettingsUsecase{
  final SettingsRepository repository;

  SettingsUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, SettingsEntity>> getSettings() => repository.getSettings();
}