// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersPageDto _$CharactersPageDtoFromJson(Map<String, dynamic> json) =>
    CharactersPageDto(
      info: InfoDto.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersPageDtoToJson(CharactersPageDto instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};

InfoDto _$InfoDtoFromJson(Map<String, dynamic> json) => InfoDto(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$InfoDtoToJson(InfoDto instance) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};
