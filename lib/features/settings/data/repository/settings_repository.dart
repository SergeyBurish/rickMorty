import 'package:dart_either/dart_either.dart';

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
      return Right(settingsDto ?? SettingsEntity(themeType: ThemeType.system));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}