import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/check_if_favourite_movie.dart';
import 'package:flutter_movie/domain/usecases/delete_favourite_movie.dart';
import 'package:flutter_movie/domain/usecases/get_favourite_movies.dart';
import 'package:flutter_movie/domain/usecases/save_movie.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final GetFavouriteMovies getFavouriteMovies;
  final SaveMovie saveMovie;
  final DeleteFavouriteMovie deleteFavouriteMovie;
  final CheckIfFavouriteMovie checkIfFavouriteMovie;

  FavouriteBloc({
    this.getFavouriteMovies,
    this.checkIfFavouriteMovie,
    this.deleteFavouriteMovie,
    this.saveMovie,
  }) : super(FavouriteInitial());

  @override
  Stream<FavouriteState> mapEventToState(
    FavouriteEvent event,
  ) async* {
    if (event is LoadFavouriteMoviesEvent) {
      yield* await _loadFavouriteMovies();
    } else if (event is DeleteFavouriteMovieEvent) {
      await deleteFavouriteMovie(MovieParams(id: event.movieId));
      yield* await _loadFavouriteMovies();
    } else if (event is ToggleFavouriteMovieEvent) {
      if (event.isFavourite)
        await deleteFavouriteMovie(MovieParams(id: event.movieEntity.id));
      else
        await saveMovie(event.movieEntity);

      final eitherResponse =
          await checkIfFavouriteMovie(MovieParams(id: event.movieEntity.id));
      yield eitherResponse.fold(
        (error) => FavouriteMovieError(appErrorType: error.errorType),
        (isFavourite) => IsFavouriteMovie(isFavourite: isFavourite),
      );
    } else if (event is CheckIfFavouriteMovieEvent) {
      final eitherResponse =
          await checkIfFavouriteMovie(MovieParams(id: event.movieId));

      yield eitherResponse.fold(
        (error) => FavouriteMovieError(appErrorType: error.errorType),
        (isFavourite) => IsFavouriteMovie(isFavourite: isFavourite),
      );
    }
  }

  Future _loadFavouriteMovies() async {
    final eitherResponse = await getFavouriteMovies(NoParams());
    return eitherResponse.fold(
        (error) => FavouriteMovieError(appErrorType: error.errorType),
        (movies) => FavouriteMoviesLoaded(movies: movies));
  }
}
