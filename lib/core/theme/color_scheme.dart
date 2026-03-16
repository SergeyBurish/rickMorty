import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme>{
  final Color appBarBackground;
  final Color favoriteStar;
    
  const AppColorScheme({
    required this.appBarBackground,
    required this.favoriteStar,
  });

  @override
  AppColorScheme copyWith({
    Color? appBarBackground,
    Color? favoriteStar,
  }) {
    return AppColorScheme(
      appBarBackground: appBarBackground ?? this.appBarBackground,
      favoriteStar: favoriteStar ?? this.favoriteStar,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      appBarBackground: Color.lerp(appBarBackground, other.appBarBackground, t)!,
      favoriteStar: Color.lerp(favoriteStar, other.favoriteStar, t)!,
    );  
  }
}