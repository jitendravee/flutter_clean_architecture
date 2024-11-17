import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:clean_architecture/core/usecases/usercase.dart';
import 'package:clean_architecture/features/movie/domain/entities/movie.dart';
import 'package:clean_architecture/features/movie/domain/repository/movie_repository.dart';
import 'package:fpdart/src/either.dart';

class MovieFetch implements Usercase<List<Movie>, NoParams> {
  final MovieRepository movieRepository;
  MovieFetch(this.movieRepository);
  @override
  Future<Either<FailureError, List<Movie>>> call(NoParams params) async {
    return await movieRepository.getMovies();
  }
}
