import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lumina/features/movies/domain/entity/actor_entity.dart';

abstract class ActorState extends Equatable {
  final List<ActorEntity>? actors;
  final DioException? exception;
  const ActorState({this.actors, this.exception});
  @override
  List<Object?> get props => [actors, exception];
}

class ActorLoading extends ActorState {
  const ActorLoading();
}

class ActorException extends ActorState {
  const ActorException(DioException exception) : super(exception: exception);
}

class ActorDone extends ActorState {
  const ActorDone(List<ActorEntity> actors) : super(actors: actors);
}

class ActorEmpty extends ActorState {
  const ActorEmpty();
}
