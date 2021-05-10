import 'package:equatable/equatable.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final num voteAverage;
  final String posterPath;
  final String backdropPath;

  const MovieDetailEntity({
    this.id,
    this.title,
    this.releaseDate,
    this.overview,
    this.voteAverage,
    this.posterPath,
    this.backdropPath,
  });

  @override
  List<Object> get props => [id];
}
