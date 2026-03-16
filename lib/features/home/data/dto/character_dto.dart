import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/character.dart';

part 'character_dto.g.dart';

@JsonSerializable()
class CharacterDto extends Character {
  CharacterDto({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.image,
    super.type,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) => _$CharacterDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDtoToJson(this);
}