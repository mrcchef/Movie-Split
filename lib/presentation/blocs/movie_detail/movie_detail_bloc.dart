import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc({@required this.getMovieDetail})
      : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> response =
          await getMovieDetail(MovieParams(id: event.movieId));

      yield response.fold(
          (error) => MovieDetailError(),
          (movieDetailEntity) =>
              MovieDetailLoaded(movieDetailEntity: movieDetailEntity));
    }
  }
}
