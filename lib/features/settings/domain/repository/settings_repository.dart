import 'package:dart_either/dart_either.dart';

import '../entity/serrings_entity.dart';

abstract interface class SettingsRepository {
  Future<Either<Exception, SettingsEntity>> getSettings();
}