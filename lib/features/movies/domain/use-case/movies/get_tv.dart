import '../../../../../core/resources/data_state.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../entity/movie_entity.dart';
import '../../repository/movie_repository.dart';

class GetTvUseCase implements UseCase<DataState<List<MovieEntity>>, void> {
  final MovieRepository _movieRepository;
  const GetTvUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({void params}) {
    return _movieRepository.getTv();
  }
}
