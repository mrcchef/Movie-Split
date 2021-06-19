import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';

// part 'movie_backdrop_event.dart';
// part 'movie_backdrop_state.dart';

class MovieBackdropCubit extends Cubit<MovieEntity> {
  MovieBackdropCubit() : super(null);

  void movieBackdropChangeEvent(MovieEntity movie) => emit(movie);

  // @override
  // Stream<MovieBackdropState> mapEventToState(
  //   MovieBackdropEvent event,
  // ) async* {
  //   if (event is MovieBackdropChangeEvent) {
  //     yield MovieBackdropLoaded(movie: event.movie);
  //   }
  // }
}
