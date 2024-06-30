import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumina/core/resources/data_state.dart';

import '../../../domain/use-case/actors/get_actors.dart';
import 'actor_event.dart';
import 'actor_state.dart';

class ActorBloc extends Bloc<ActorEvent, ActorState> {
  final GetActorsUseCase _getActorsUseCase;
  ActorBloc(this._getActorsUseCase) : super(const ActorLoading()) {
    on<GetActors>(onGetActors);
  }
  Future<void> onGetActors(GetActors event, Emitter<ActorState> emit) async {
    final dataState = await _getActorsUseCase(params: event.movieEntity);
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const ActorEmpty());
      } else {
        emit(ActorDone(dataState.data!));
      }
    } else if (dataState is DataException) {
      emit(ActorException(dataState.exception!));
    }
  }
}
