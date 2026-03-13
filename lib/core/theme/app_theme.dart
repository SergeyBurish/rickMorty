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
        ),
        const AppTextStyles(
          characterText: TextStyle(
            fontSize: 18,
          ),
          buttonText: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold
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