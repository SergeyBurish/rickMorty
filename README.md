# rick_morty

Flutter проект для просмотра персонажей Рика и Морти

Апи: 
https://rickandmortyapi.com/api

веб версия:
https://sergeyburish.github.io/rickMorty/
(в России возможно потребуется vpn)

Сборка и запуск
Web:
В корне проекта в терминале запустить команду:
flutter build web
Возможно придётся указать base-href в зависимости от выбранного хостинга (читать в документации хостинга)
flutter build web --base-href /myBaseHref/

После сборки в терминале будет указан путь по которому находится собраный проект готовый к выгрузке на хостинг.

Android:
В корне проекта в терминале запустить команду:
flutter build apk

После сборки в терминале будет указан путь по которому находится apk готовый к выгрузке на устройство. Возможно потребуется дать разрешение на установку.

iOS: 
(немного сложнее, собирается только на macOS)
1. Prepare your environment
  1. Install the latest version of Xcode from the Mac App Store.
  2. Agree to the Xcode licenses by running sudo xcodebuild -license in the terminal.
  3. Set up Xcode command-line tools: sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'.
  4. Install CocoaPods: Follow the official CocoaPods installation guide to support plugins with native iOS code.

2. Configure Xcode Project Settings:
  1. Open your project's Xcode workspace by running open ios/Runner.xcworkspace from your Flutter project directory.
  2. In Xcode, select the Runner target in the project navigator.
  3. In the Signing & Capabilities tab, ensure "Automatically manage signing" is checked (for most cases) and select your Team associated with your Apple Developer account.
  4. Review and update the Bundle Identifier, app version, and build numbers in the General and Build Settings tabs.

3. Create the Build Archive (.ipa file):
  1. Run the following command in your terminal from the root of your Flutter project:
  
flutter build ipa

2. This command produces an Xcode build archive (.xcarchive file) and an App Store app bundle (.ipa file) in the build/ios/ipa/ directory.


версия Flutter и зависимости:
Flutter (Channel stable, 3.38.5)

environment:
  sdk: ^3.10.4

dependencies:
  flutter:
    sdk: flutter
  auto_route: ^11.1.0
  flutter_bloc: ^9.1.1
  get_it: ^9.2.0
  injectable: ^2.7.1+4
  dio: ^5.9.1
  dart_either: ^2.0.0
  copy_with_extension: ^11.0.0
  json_annotation: ^4.9.0
  easy_localization: ^3.0.8
  shared_preferences: ^2.5.4
  cached_network_image: ^3.4.1
  flutter_launcher_icons: ^0.14.4
