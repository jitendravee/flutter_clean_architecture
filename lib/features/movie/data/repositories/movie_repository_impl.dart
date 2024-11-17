import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:clean_architecture/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:clean_architecture/features/movie/domain/entities/movie.dart';
import 'package:clean_architecture/features/movie/domain/repository/movie_repository.dart';
import 'package:fpdart/src/either.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl(this.movieRemoteDataSource);
  @override
  Future<Either<FailureError, List<Movie>>> getMovies() async {
    try {
      final movies = await movieRemoteDataSource.getAllMovies();
      return right(movies);
    } catch (e) {
      return left(FailureError(message: e.toString()));
    }
  }
}
