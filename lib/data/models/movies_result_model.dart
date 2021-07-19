import './movie_model.dart';

class MoviesResultModel {
  late List<MovieModel> movies = [];

  MoviesResultModel({
    required this.movies,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      // movies = new List<MovieModel>();
      json['results'].forEach((v) {
        movies.add(new MovieModel.fromJson(v));
      });
    }
  }
}
