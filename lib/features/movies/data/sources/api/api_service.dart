import 'package:dio/dio.dart';
import 'package:lumina/core/constants/constants.dart';
import 'package:lumina/features/movies/data/model/actor_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/movie_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: kBaseApiUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/movie/popular')
  Future<HttpResponse<List<MovieModel>>> getPopularMovies({
    @Query("api_key") String? kApiKey,
  });

  @GET('/discover/movie')
  Future<HttpResponse<List<MovieModel>>> getCartoons(
      {@Query("api_key") String? kApiKey,
      @Query("with_genres") String? kAnimationGenre});

  @GET('/tv/popular')
  Future<HttpResponse<List<MovieModel>>> getTv({
    @Query("api_key") String? kApiKey,
  });

  @GET('/trending/all/week')
  Future<HttpResponse<List<MovieModel>>> getTrending({
    @Query("api_key") String? kApiKey,
  });

  @GET('/movie/upcoming')
  Future<HttpResponse<List<MovieModel>>> getUpcomingMovies({
    @Query("api_key") String? kApiKey,
  });
  @GET('/{mediaType}/{id}/credits')
  Future<HttpResponse<List<ActorModel>>> getActors(
      {@Query("api_key") String? kApiKey,
      @Path("mediaType") String? mediaType,
      @Path("id") int? id});
}
