import 'dart:convert';
import 'package:clean_architecture/features/movie/data/model/movie_model.dart';
import 'package:http/http.dart' as http;

abstract interface class MovieRemoteDataSource {
  Future<List<MovieModel>> getAllMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final String _baseUrl = 'http://localhost:5500/lib/hello.json';

  @override
  Future<List<MovieModel>> getAllMovies() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}
