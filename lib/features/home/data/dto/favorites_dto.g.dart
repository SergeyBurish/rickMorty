// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesDto _$FavoritesDtoFromJson(Map<String, dynamic> json) => FavoritesDto(
  favoriteIds: (json['favoriteIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toSet(),
);

Map<String, dynamic> _$FavoritesDtoToJson(FavoritesDto instance) =>
    <String, dynamic>{'favoriteIds': instance.favoriteIds.toList()};
