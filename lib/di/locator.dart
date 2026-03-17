import '../features/home/domain/usecase/home_usecase.dart';
import '../features/settings/domain/usecase/settings_usecase.dart';
import 'injector.dart';

class Locator {
  static SettingsUsecase get settingsUsecase => getIt<SettingsUsecase>();
  static HomeUsecase get homeUsecase => getIt<HomeUsecase>();
}