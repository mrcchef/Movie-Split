import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:hive/hive.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @HiveField(0)
  final int movieId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String backdropPath;

  MovieTable({
    @required this.movieId,
    @required this.title,
    @required this.backdropPath,
  }) : super(
          backdropPath: backdropPath,
          id: movieId,
          title: title,
          overview: '',
          posterPath: '',
          releaseDate: '',
          voteAverage: 0,
        );

  @override
  List<Object> get props => [movieId, title];
}
