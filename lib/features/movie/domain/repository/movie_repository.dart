import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:clean_architecture/features/movie/domain/entities/movie.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MovieRepository {
  Future<Either<FailureError, List<Movie>>> getMovies();
}
