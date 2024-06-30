import 'package:lumina/core/constants/constants.dart';
import 'package:lumina/features/movies/domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {super.adult,
      super.backdropPath,
      super.genreIds,
      super.id,
      super.originalLanguage,
      super.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      super.releaseDate,
      super.title,
      super.video,
      super.voteAverage,
      super.voteCount,
      super.mediaType,
      super.originCountry,
      super.actors});

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
        adult: map["adult"],
        backdropPath: map["backdrop_path"],
        genreIds: map["genre_ids"],
        id: map["id"],
        originalLanguage: map["original_language"],
        originalTitle: map["original_title"] ?? map["original_name"],
        overview: map["overview"],
        popularity: map["popularity"],
        posterPath: map["poster_path"],
        releaseDate: map["release_date"] ?? map["first_air_date"],
        title: map["title"] ?? map["name"],
        video: map["video"],
        voteAverage: map["vote_average"],
        voteCount: map["vote_count"],
        mediaType: map["media_type"] ?? "movie",
        originCountry: map["origin_country"]);
  }
  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      adult: entity.adult,
      backdropPath: entity.backdropPath,
      genreIds: entity.genreIds,
      id: entity.id,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      releaseDate: entity.releaseDate,
      title: entity.title,
      video: entity.video,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      mediaType: entity.mediaType,
      originCountry: entity.originCountry,
    );
  }

  String backdropImageUrl(String wSize) {
    String url = kImageApiUrl + wSize + backdropPath!;
    return url;
  }

  String posterImageUrl(String wSize) {
    String url = kImageApiUrl + wSize + posterPath!;
    return url;
  }
}
