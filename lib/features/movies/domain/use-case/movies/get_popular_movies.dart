import 'package:lumina/core/resources/data_state.dart';
import 'package:lumina/core/use_case/use_case.dart';
import 'package:lumina/features/movies/domain/entity/movie_entity.dart';
import 'package:lumina/features/movies/domain/repository/movie_repository.dart';

class GetPopularMoviesUseCase
    implements UseCase<DataState<List<MovieEntity>>, void> {
  final MovieRepository _movieRepository;
  const GetPopularMoviesUseCase(this._movieRepository);
  @override
  Future<DataState<List<MovieEntity>>> call({void params}) {
    return _movieRepository.getPopularMovies();
  }
}
