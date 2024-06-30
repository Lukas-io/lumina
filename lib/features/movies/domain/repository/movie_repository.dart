import 'package:lumina/features/movies/domain/entity/actor_entity.dart';
import 'package:lumina/features/movies/domain/entity/movie_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class MovieRepository {
  Future<DataState<List<MovieEntity>>> getPopularMovies();
  Future<DataState<List<MovieEntity>>> getCartoons();
  Future<DataState<List<MovieEntity>>> getTv();
  Future<List<MovieEntity>> getFavourite();
  Future<DataState<List<MovieEntity>>> getTrending();
  Future<DataState<List<MovieEntity>>> getUpcomingMovies();
  Future<DataState<List<ActorEntity>>> getActors({String? mediaType, int? id});
}
