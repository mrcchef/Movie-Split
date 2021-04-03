import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';

// This is a movie entity which has all the necessary keywords that are required to
// represent a movie
class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity({
    @required this.posterPath,
    @required this.id,
    @required this.backdropPath,
    @required this.title,
    @required this.voteAverage,
    @required this.releaseDate,
    @required this.overview,
  }) : assert(id != null, "Movie id must not be null");

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
  // If it is true then toString method of the object of the class will be overridden with props
  // If we print the object of class so usually the instance will be printed but now
  // instead of it list of attributes will print that are there in props getter

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      posterPath: movieDetailEntity.posterPath,
      id: movieDetailEntity.id,
      backdropPath: movieDetailEntity.backdropPath,
      title: movieDetailEntity.title,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
      overview: movieDetailEntity.overview,
    );
  }
}
