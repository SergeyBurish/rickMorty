import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/serrings_entity.dart';

part 'settings_dto.g.dart';

@JsonSerializable()
class SettingsDto extends SettingsEntity {
  SettingsDto({required super.themeType});

  factory SettingsDto.fromJson(Map<String, dynamic> json) => _$SettingsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsDtoToJson(this);
}
