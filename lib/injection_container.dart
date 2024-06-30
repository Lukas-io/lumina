import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lumina/features/movies/data/repository/movie_repository_impl.dart';
import 'package:lumina/features/movies/data/sources/api/api_service.dart';
import 'package:lumina/features/movies/domain/use-case/actors/get_actors.dart';
import 'package:lumina/features/movies/presentation/bloc/actor/actor_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_bloc.dart';

import 'features/movies/domain/repository/movie_repository.dart';
import 'features/movies/domain/use-case/movies/get_cartoons.dart';
import 'features/movies/domain/use-case/movies/get_popular_movies.dart';
import 'features/movies/domain/use-case/movies/get_trending.dart';
import 'features/movies/domain/use-case/movies/get_tv.dart';
import 'features/movies/domain/use-case/movies/get_upcoming_movies.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  sl.registerSingleton<Dio>(Dio());

  //dependencies
  sl.registerFactory<ApiService>(() => ApiService(sl()));

  sl.registerFactory<MovieRepository>(() => MovieRepositoryImpl(sl()));

  //use cases
  sl.registerFactory<GetActorsUseCase>(() => GetActorsUseCase(sl()));
  sl
    ..registerSingleton<GetCartoonsUseCase>(GetCartoonsUseCase(sl()))
    ..registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(sl()))
    ..registerSingleton<GetTrendingUseCase>(GetTrendingUseCase(sl()))
    ..registerSingleton<GetTvUseCase>(GetTvUseCase(sl()))
    ..registerSingleton<GetUpcomingMoviesUseCase>(
        GetUpcomingMoviesUseCase(sl()));

  //Blocs
  sl.registerFactory<ActorBloc>(() => ActorBloc(sl()));
  sl.registerFactory<MovieBloc>(() => MovieBloc(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
}
