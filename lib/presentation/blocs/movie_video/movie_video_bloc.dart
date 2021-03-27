import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/video_entity.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';

part 'movie_video_event.dart';
part 'movie_video_state.dart';

class MovieVideoBloc extends Bloc<MovieVideoEvent, MovieVideoState> {
  final MovieRepository movieRepository;

  MovieVideoBloc({@required this.movieRepository}) : super(MovieVideoInitial());

  @override
  Stream<MovieVideoState> mapEventToState(
    MovieVideoEvent event,
  ) async* {
    if (event is LoadMovieVideo) {
      final eitherResponse = await movieRepository.getMovieVideo(event.movieId);
      yield eitherResponse.fold(
          (error) => MovieVideoError(appErrorType: error.errorType),
          (video) => MovieVideoLoaded(videos: video));
    }
  }
}
