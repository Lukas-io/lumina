import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_entity.dart';

abstract class MovieState extends Equatable {
  final DioException? exception;
  final List<MovieEntity>? movies;
  const MovieState({this.exception, this.movies});

  @override
  List<Object?> get props => [];
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieException extends MovieState {
  const MovieException(DioException? exception) : super(exception: exception);
}

class MovieEmpty extends MovieState {
  const MovieEmpty();
}

class MovieDone extends MovieState {
  const MovieDone(List<MovieEntity>? movies) : super(movies: movies);
}
