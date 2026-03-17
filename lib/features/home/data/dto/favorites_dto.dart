import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/favorites.dart';

part 'favorites_dto.g.dart';

@JsonSerializable()
class FavoritesDto extends Favorites {
  FavoritesDto({required super.favoriteIds});

  factory FavoritesDto.fromJson(Map<String, dynamic> json) => _$FavoritesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FavoritesDtoToJson(this);
}

extension FavoritesMapper on Favorites {
  FavoritesDto get toDto => FavoritesDto(
    favoriteIds: favoriteIds,
  );
}