import '../../../../../core/use_case/use_case.dart';
import '../../entity/movie_entity.dart';
import '../../repository/movie_repository.dart';

class GetFavouriteUseCase implements UseCase<List<MovieEntity>, void> {
  final MovieRepository _movieRepository;
  const GetFavouriteUseCase(this._movieRepository);

  @override
  Future<List<MovieEntity>> call({void params}) {
    return _movieRepository.getFavourite();
  }
}
