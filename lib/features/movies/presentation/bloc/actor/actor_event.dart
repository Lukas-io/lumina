import 'package:equatable/equatable.dart';
import 'package:lumina/features/movies/domain/entity/movie_entity.dart';

abstract class ActorEvent extends Equatable {
  final MovieEntity? movieEntity;
  const ActorEvent({this.movieEntity});

  @override
  List<Object?> get props => [movieEntity];
}

class GetActors extends ActorEvent {
  const GetActors(MovieEntity movieEntity) : super(movieEntity: movieEntity);
}
