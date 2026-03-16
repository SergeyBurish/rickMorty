import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData createLightTheme() => _createTheme();
  static ThemeData createDarkTheme() => _createTheme();

  static ThemeData _createTheme(){
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        const AppColorScheme(
          appBarBackground: Color.fromARGB(107, 214, 231, 244),
          favoriteStar: Colors.orange,
        ),
        const AppTextStyles(
          characterText: TextStyle(
            fontSize: 18,
          ),
          typeText: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

extension BuildContextExt on BuildContext {
  AppColorScheme get colorScheme =>
      Theme.of(this).extension<AppColorScheme>()!;

  AppTextStyles get textStyles =>
      Theme.of(this).extension<AppTextStyles>()!;
}