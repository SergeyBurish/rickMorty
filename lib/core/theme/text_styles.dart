import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles>{
  final TextStyle characterText;
  final TextStyle buttonText;
    
  const AppTextStyles({
    required this.characterText,
    required this.buttonText,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? characterText,
    TextStyle? buttonText,
  }) {
    return AppTextStyles(
      characterText: characterText ?? this.characterText,
      buttonText: buttonText ?? this.buttonText,
    );  
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this;
    return AppTextStyles(
      characterText: TextStyle.lerp(characterText, other.characterText, t)!,
      buttonText: TextStyle.lerp(buttonText, other.buttonText, t)!,
    );
  }
}