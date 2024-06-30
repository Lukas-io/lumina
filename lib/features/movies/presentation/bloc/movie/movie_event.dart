import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCartoons extends MovieEvent {
  const GetCartoons();
}

class GetPopularMovies extends MovieEvent {
  const GetPopularMovies();
}

class GetTrending extends MovieEvent {
  const GetTrending();
}

class GetTv extends MovieEvent {
  const GetTv();
}

class GetUpcomingMovies extends MovieEvent {
  const GetUpcomingMovies();
}
