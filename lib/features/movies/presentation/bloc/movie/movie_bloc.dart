import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_event.dart';
import 'package:lumina/features/movies/presentation/bloc/movie/movie_state.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/use-case/movies/get_cartoons.dart';
import '../../../domain/use-case/movies/get_popular_movies.dart';
import '../../../domain/use-case/movies/get_trending.dart';
import '../../../domain/use-case/movies/get_tv.dart';
import '../../../domain/use-case/movies/get_upcoming_movies.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetCartoonsUseCase _getCartoonsUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTrendingUseCase _getTrendingUseCase;
  final GetTvUseCase _getTvUseCase;
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  MovieBloc(
    this._getCartoonsUseCase,
    this._getPopularMoviesUseCase,
    this._getTrendingUseCase,
    this._getTvUseCase,
    this._getUpcomingMoviesUseCase,
  ) : super(const MovieLoading()) {
    on<GetCartoons>(onGetCartoonsUseCase);
    on<GetPopularMovies>(onGetPopularMoviesUseCase);
    on<GetTrending>(onGetTrendingUseCase);
    on<GetTv>(onGetTvUseCase);
    on<GetUpcomingMovies>(onGetUpcomingMoviesUseCase);
  }

  Future<void> onGetCartoonsUseCase(
      GetCartoons event, Emitter<MovieState> emit) async {
    final dataState = await _getCartoonsUseCase();
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const MovieEmpty());
      } else {
        emit(MovieDone(dataState.data!));
      }
    } else if (dataState is DataException) {
      emit(MovieException(dataState.exception!));
    }
  }

  Future<void> onGetPopularMoviesUseCase(
      GetPopularMovies event, Emitter<MovieState> emit) async {
    final dataState = await _getPopularMoviesUseCase();
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const MovieEmpty());
      } else {
        emit(MovieDone(dataState.data!));
      }
    } else if (dataState is DataException) {
      emit(MovieException(dataState.exception!));
    }
  }

  Future<void> onGetTrendingUseCase(
      GetTrending event, Emitter<MovieState> emit) async {
    final dataState = await _getTrendingUseCase();
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const MovieEmpty());
      } else {
        emit(MovieDone(dataState.data!));
      }
    } else if (dataState is DataException) {
      emit(MovieException(dataState.exception!));
    }
  }

  Future<void> onGetTvUseCase(GetTv event, Emitter<MovieState> emit) async {
    final dataState = await _getTvUseCase();
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const MovieEmpty());
      } else {
        emit(MovieDone(dataState.data!));
      }
    } else if (dataState is DataException) {
      emit(MovieException(dataState.exception!));
    }
  }

  Future<void> onGetUpcomingMoviesUseCase(
      GetUpcomingMovies event, Emitter<MovieState> emit) async {
    final dataState = await _getUpcomingMoviesUseCase();
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const MovieEmpty());
      } else {
        emit(MovieDone(dataState.data!));
      }
    } else if (dataState is DataException) {
      emit(MovieException(dataState.exception!));
    }
  }
}
