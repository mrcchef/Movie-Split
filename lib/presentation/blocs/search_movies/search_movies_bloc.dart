import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final MovieRepository movieRepository;
  SearchMoviesBloc({required this.movieRepository})
      : super(SearchMoviesInitial());

  @override
  Stream<SearchMoviesState> mapEventToState(
    SearchMoviesEvent event,
  ) async* {
    if (event is LoadSearchMovie) {
      final eitherResponse =
          await movieRepository.getSearchMovies(event.searchTerm);
      yield eitherResponse.fold(
          (error) => SearchMoviesError(appErrorType: error.errorType),
          (movies) => SearchMoviesLoaded(movies: movies));
    }
  }
}
