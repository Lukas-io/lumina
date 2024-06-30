import 'package:lumina/features/movies/domain/entity/actor_entity.dart';

import '../../../../core/constants/constants.dart';

class ActorModel extends ActorEntity {
  const ActorModel({
    super.adult,
    super.gender,
    super.id,
    super.knownForDepartment,
    super.name,
    super.originalName,
    super.popularity,
    super.profilePath,
    super.castId,
    super.character,
    super.creditId,
    super.order,
  });

  String profileImageUrl(String wSize) {
    String url = kImageApiUrl + wSize + profilePath!;
    return url;
  }

  factory ActorModel.fromJson(Map<String, dynamic> map) {
    return ActorModel(
      adult: map['adult'],
      gender: map['gender'],
      id: map['id'],
      knownForDepartment: map['known_for_department'],
      name: map['name'],
      originalName: map['original_name'],
      popularity: map['popularity'],
      profilePath: map['profile_path'],
      castId: map['cast_id'],
      character: map['character'],
      creditId: map['credit_id'],
      order: map['order'],
    );
  }

  factory ActorModel.fromEntity(ActorEntity entity) {
    return ActorModel(
      adult: entity.adult,
      gender: entity.gender,
      id: entity.id,
      knownForDepartment: entity.knownForDepartment,
      name: entity.name,
      originalName: entity.originalName,
      popularity: entity.popularity,
      profilePath: entity.profilePath,
      castId: entity.castId,
      character: entity.character,
      creditId: entity.creditId,
      order: entity.order,
    );
  }
}
