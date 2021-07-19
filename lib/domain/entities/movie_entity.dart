import 'package:equatable/equatable.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';

// This is a movie entity which has all the necessary keywords that are required to
// represent a movie
class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      posterPath: movieDetailEntity.posterPath,
      id: movieDetailEntity.id,
      backdropPath: movieDetailEntity.backdropPath,
      title: movieDetailEntity.title,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
    );
  }
}
