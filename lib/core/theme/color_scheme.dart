import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme>{
  final Color appBarBackground;
  final Color appBackground;
  final Color dropdownBorderEnabled;
  final Color dropdownBorderFocused;
  final Color favoriteStar;
    
  const AppColorScheme({
    required this.appBarBackground,
    required this.appBackground,
    required this.favoriteStar, 
    required this.dropdownBorderEnabled,
    required this.dropdownBorderFocused,
  });

  @override
  AppColorScheme copyWith({
    Color? appBarBackground,
    Color? appBackground,
    Color? dropdownBorderEnabled,
    Color? dropdownBorderFocused,
    Color? favoriteStar,
  }) {
    return AppColorScheme(
      appBarBackground: appBarBackground ?? this.appBarBackground,
      appBackground: appBackground ?? this.appBackground,
      dropdownBorderEnabled: dropdownBorderEnabled ?? this.dropdownBorderEnabled,
      dropdownBorderFocused: dropdownBorderFocused ?? this.dropdownBorderFocused,
      favoriteStar: favoriteStar ?? this.favoriteStar,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      appBarBackground: Color.lerp(appBarBackground, other.appBarBackground, t)!,
      appBackground: Color.lerp(appBackground, other.appBackground, t)!,
      dropdownBorderEnabled: Color.lerp(dropdownBorderEnabled, other.dropdownBorderEnabled, t)!,
      dropdownBorderFocused: Color.lerp(dropdownBorderFocused, other.dropdownBorderFocused, t)!,
      favoriteStar: Color.lerp(favoriteStar, other.favoriteStar, t)!,
    );  
  }
}