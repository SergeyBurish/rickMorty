import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData createLightTheme() {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        const AppColorScheme(
          appBarBackground: Color.fromARGB(107, 214, 231, 244),
          appBackground: Color.fromARGB(210, 172, 201, 215),
          dropdownBorderEnabled: Colors.black38,
          dropdownBorderFocused: Colors.black87,
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
          dropdownText: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
  static ThemeData createDarkTheme() {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        const AppColorScheme(
          appBarBackground: Color.fromARGB(255, 64, 142, 156),
          appBackground: Color.fromARGB(227, 69, 91, 130),
          dropdownBorderEnabled: Colors.white54,
          dropdownBorderFocused: Colors.white,
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
          dropdownText: TextStyle(
            color: Colors.white,
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