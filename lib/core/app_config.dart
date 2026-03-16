import 'dart:ui';

class AppConfig {
  static const bool useMockApi = bool.fromEnvironment('USE_MOCK_API');
  static const List<AppLocale> supportedLocales = [AppLocale.en, AppLocale.ru];
}

enum AppLocale {
  system('', ''),
  en('en', 'US'),
  ru('ru', 'RU');

  final String languageCode;
  final String countryCode;

  const AppLocale(this.languageCode, this.countryCode);

  Locale get locale => Locale(languageCode, countryCode);
}