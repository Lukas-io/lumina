import 'package:lumina/features/movies/domain/entity/actor_entity.dart';
import 'package:lumina/features/movies/domain/entity/movie_entity.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../repository/movie_repository.dart';

class GetActorsUseCase
    implements UseCase<DataState<List<ActorEntity>>, MovieEntity> {
  final MovieRepository _movieRepository;
  const GetActorsUseCase(this._movieRepository);

  @override
  Future<DataState<List<ActorEntity>>> call({MovieEntity? params}) {
    return _movieRepository.getActors(
        mediaType: params?.mediaType, id: params?.id);
  }
}
