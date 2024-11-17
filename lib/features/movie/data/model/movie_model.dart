import 'package:clean_architecture/features/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.description, required super.name, required super.views});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'description': description,
      'name': name,
      'views': views
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
        description: map['description'] as String,
        name: map['name'],
        views: map['views']);
  }
}
