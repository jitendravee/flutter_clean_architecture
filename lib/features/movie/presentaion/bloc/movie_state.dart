part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class FetchMovieListsSucccessState extends MovieState {}

final class FetchMovieListsLoadingState extends MovieState {}

final class FetchMovieListsFailureState extends MovieState {}
