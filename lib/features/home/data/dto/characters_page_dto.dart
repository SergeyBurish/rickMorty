import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/characters_page.dart';
import 'character_dto.dart';

part 'characters_page_dto.g.dart';

@JsonSerializable()
class CharactersPageDto {
  final InfoDto info;
  final List<CharacterDto> results;

  CharactersPageDto({
    required this.info,
    required this.results,
  });

  factory CharactersPageDto.fromJson(Map<String, dynamic> json) => _$CharactersPageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersPageDtoToJson(this);
}

@JsonSerializable()
class InfoDto extends Info {
  InfoDto({required super.count, required super.pages, super.next, super.prev});

  factory InfoDto.fromJson(Map<String, dynamic> json) => _$InfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoDtoToJson(this);
}

extension CharactersPageDtoMapper on CharactersPageDto {
  CharactersPage get toCharactersPage => CharactersPage(
    info: info,
    characters: results,
  );
}

extension CharactersPageMapper on CharactersPage {
  CharactersPageDto get toDto => CharactersPageDto(
    info: info.toDto, 
    results: characters.map((e)=>CharacterDto(
      id: e.id,
      name: e.name,
      status: e.status,
      species: e.species,
      image: e.image,
      type: e.type,
    )).toList(),
  );
}

extension InfoMapper on Info {
  InfoDto get toDto => InfoDto(
    count: count, 
    pages: pages,
    next: next,
    prev: prev,
  );
}