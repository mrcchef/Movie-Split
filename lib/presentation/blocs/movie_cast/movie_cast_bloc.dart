import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_cast_entity.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/usecases/get_movie_cast.dart';

part 'movie_cast_event.dart';
part 'movie_cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  final GetMovieCast getMovieCast;

  MovieCastBloc({@required this.getMovieCast}) : super(MovieCastInitial());

  @override
  Stream<MovieCastState> mapEventToState(
    MovieCastEvent event,
  ) async* {
    if (event is LoadMovieCastEvent) {
      final Either<AppError, List<MovieCastEntity>> eitherResponse =
          await getMovieCast(MovieParams(id: event.movieId));
      yield eitherResponse.fold(
          (error) => MovieCastError(appErrorType: error.errorType),
          (cast) => MovieCastLoaded(cast: cast));
    }
  }
}
