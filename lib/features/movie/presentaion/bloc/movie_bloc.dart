import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/usecases/usercase.dart';
import 'package:clean_architecture/features/movie/domain/usecases/movie_fetch.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieFetch _movieFetch;

  MovieBloc({required MovieFetch movieFetch})
      : _movieFetch = movieFetch,
        super(MovieInitial()) {
    on<FetchMovieLists>(_onFetchMovieLists);
  }

  Future<void> _onFetchMovieLists(
      FetchMovieLists event, Emitter<MovieState> emit) async {
    emit(FetchMovieListsLoadingState());
    try {
      final res = await _movieFetch(NoParams());
      res.fold(
        (l) => emit(FetchMovieListsFailureState()),
        (r) => emit(FetchMovieListsSucccessState()),
      );
    } catch (e) {
      emit(FetchMovieListsFailureState());
    }
  }
}
