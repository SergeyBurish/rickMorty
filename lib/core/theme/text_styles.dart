import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles>{
  final TextStyle characterText;
  final TextStyle typeText;
  final TextStyle dropdownText;
    
  const AppTextStyles({
    required this.characterText,
    required this.typeText,
    required this.dropdownText,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? characterText,
    TextStyle? typeText,
    TextStyle? dropdownText,
  }) {
    return AppTextStyles(
      characterText: characterText ?? this.characterText,
      typeText: typeText ?? this.typeText,
      dropdownText: dropdownText ?? this.dropdownText,
    );  
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this;
    return AppTextStyles(
      characterText: TextStyle.lerp(characterText, other.characterText, t)!,
      typeText: TextStyle.lerp(typeText, other.typeText, t)!,
      dropdownText: TextStyle.lerp(dropdownText, other.dropdownText, t)!,
    );
  }
}