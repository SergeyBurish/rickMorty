# rick\_morty

Flutter проект для просмотра персонажей Рика и Морти

Апи:  
[https://rickandmortyapi.com/api](https://rickandmortyapi.com/api)

веб версия:  
[https://sergeyburish.github.io/rickMorty/](https://sergeyburish.github.io/rickMorty/)  
(в России возможно потребуется vpn)

## Сборка и запуск

-   Web:

В корне проекта в терминале запустить команду:  
flutter build web  
Возможно придётся указать base-href в зависимости от выбранного хостинга (читать в документации хостинга)  
flutter build web --base-href /myBaseHref/

После сборки в терминале будет указан путь по которому находится собраный проект готовый к выгрузке на хостинг.

-   Android:

В корне проекта в терминале запустить команду:  
flutter build apk

После сборки в терминале будет указан путь по которому находится apk готовый к выгрузке на устройство. Возможно потребуется дать разрешение на установку.

-   iOS:

(немного сложнее, собирается только на macOS)

Prepare your environment  

-   Install the latest version of Xcode from the Mac App Store.
    
-   Agree to the Xcode licenses by running sudo xcodebuild -license in the terminal.
    
-   Set up Xcode command-line tools: sudo sh -c ‘xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch’.
    
-   Install CocoaPods: Follow the official CocoaPods installation guide to support plugins with native iOS code.
    

Configure Xcode Project Settings:  

-   Open your project’s Xcode workspace by running open ios/Runner.xcworkspace from your Flutter project directory.
    
-   In Xcode, select the Runner target in the project navigator.
    
-   In the Signing & Capabilities tab, ensure “Automatically manage signing” is checked (for most cases) and select your Team associated with your Apple Developer account.
    
-   Review and update the Bundle Identifier, app version, and build numbers in the General and Build Settings tabs.
    

Create the Build Archive (.ipa file):  

-   Run the following command in your terminal from the root of your Flutter project:

flutter build ipa

-   This command produces an Xcode build archive (.xcarchive file) and an App Store app bundle (.ipa file) in the build/ios/ipa/ directory.

### версия Flutter и зависимости:

Flutter (Channel stable, 3.38.5)

environment:  
sdk: ^3.10.4

dependencies:

-   flutter:
-   sdk: flutter
-   auto\_route: ^11.1.0
-   flutter\_bloc: ^9.1.1
-   get\_it: ^9.2.0
-   injectable: ^2.7.1+4
-   dio: ^5.9.1
-   dart\_either: ^2.0.0
-   copy\_with\_extension: ^11.0.0
-   json\_annotation: ^4.9.0
-   easy\_localization: ^3.0.8
-   shared\_preferences: ^2.5.4
-   cached\_network\_image: ^3.4.1
-   flutter\_launcher\_icons: ^0.14.4