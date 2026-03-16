import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles>{
  final TextStyle characterText;
  final TextStyle typeText;
    
  const AppTextStyles({
    required this.characterText,
    required this.typeText,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? characterText,
    TextStyle? typeText,
  }) {
    return AppTextStyles(
      characterText: characterText ?? this.characterText,
      typeText: typeText ?? this.typeText,
    );  
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this;
    return AppTextStyles(
      characterText: TextStyle.lerp(characterText, other.characterText, t)!,
      typeText: TextStyle.lerp(typeText, other.typeText, t)!,
    );
  }
}