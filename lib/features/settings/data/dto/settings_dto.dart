import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/app_config.dart';
import '../../domain/entity/serrings_entity.dart';

part 'settings_dto.g.dart';

@JsonSerializable()
class SettingsDto extends SettingsEntity {
  SettingsDto({required super.themeMode, required super.locale});

  factory SettingsDto.fromJson(Map<String, dynamic> json) => _$SettingsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsDtoToJson(this);
}

extension SettingsMapper on SettingsEntity {
  SettingsDto toDto() => SettingsDto(themeMode: themeMode, locale: locale);
}