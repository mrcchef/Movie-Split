import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/get_trending.dart';

part 'movie_crousel_event.dart';
part 'movie_crousel_state.dart';

class MovieCrouselBloc extends Bloc<MovieCrouselEvent, MovieCrouselState> {
  final GetTrending getTrending;
  MovieCrouselBloc({@required this.getTrending}) : super(MovieCrouselInitial());

  @override
  Stream<MovieCrouselState> mapEventToState(
    MovieCrouselEvent event,
  ) async* {
    if (event is CrouselLoadEvent) {
      final eitherResponse = await getTrending(NoParams());
      eitherResponse.fold(
        (l) => MovieCrouselError(),
        (movies) => MovieCrouselLoaded(
            movies: movies, defaultIndex: event.defaultIndex),
      );
    }
  }
}
