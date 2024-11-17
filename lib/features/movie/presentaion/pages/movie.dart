import 'package:clean_architecture/features/movie/presentaion/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context
        .read<MovieBloc>()
        .add(FetchMovieLists())); // Prevents context issues
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FetchMovieListsLoadingState) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is FetchMovieListsSucccessState) {
          return Scaffold(
            body: Center(child: Text('done ✌️')),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Movie Lists'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          body: const Text('No movies found'),
        );
      },
    );
  }
}
