import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/get_trending.dart';
import 'package:flutter_movie/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/crousel_load_error_widget.dart';

part 'movie_crousel_event.dart';
part 'movie_crousel_state.dart';

class MovieCrouselBloc extends Bloc<MovieCrouselEvent, MovieCrouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  MovieCrouselBloc(
      {@required this.getTrending, @required this.movieBackdropBloc})
      : super(MovieCrouselInitial());

  @override
  Stream<MovieCrouselState> mapEventToState(MovieCrouselEvent event) async* {
    if (event is CrouselLoadEvent) {
      final eitherResponse = await getTrending(NoParams());
      yield eitherResponse.fold(
        (error) => MovieCrouselError(errorType: error.errorType),
        (movies) {
          movieBackdropBloc
              .add(MovieBackdropChangeEvent(movie: movies[event.defaultIndex]));
          return MovieCrouselLoaded(
              movies: movies, defaultIndex: event.defaultIndex);
        },
      );
    }
  }
}
