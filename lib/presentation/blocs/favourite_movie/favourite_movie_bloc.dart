import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/check_if_favourite_movie.dart';
import 'package:flutter_movie/domain/usecases/get_favourite_movies.dart';
import 'package:flutter_movie/domain/usecases/save_favourite_movie.dart';
import 'package:flutter_movie/domain/usecases/delete_favourite_movie.dart';

part 'favourite_movie_event.dart';
part 'favourite_movie_state.dart';

class FavouriteMovieBloc
    extends Bloc<FavouriteMovieEvent, FavouriteMovieState> {
  final GetFavouriteMovies getFavouriteMovies;
  final CheckIfFavouriteMovie checkIfFavouriteMovie;
  final DeleteFavouriteMovie deleteFavouriteMovie;
  final SaveFavouriteMovie saveFavouriteMovie;

  FavouriteMovieBloc({
    @required this.getFavouriteMovies,
    @required this.checkIfFavouriteMovie,
    @required this.deleteFavouriteMovie,
    @required this.saveFavouriteMovie,
  }) : super(FavouriteMovieInitial());

  @override
  Stream<FavouriteMovieState> mapEventToState(
    FavouriteMovieEvent event,
  ) async* {
    if (event is ToggleFavouriteMovieEvent) {
      if (event.isFavourite)
        await deleteFavouriteMovie(event.movieEntity.id);
      else
        await saveFavouriteMovie(event.movieEntity);

      final isFavourite = await checkIfFavouriteMovie(event.movieEntity.id);

      yield isFavourite.fold(
          (error) => FavouriteMovieError(appErrorType: error.errorType),
          (isFavourite) => IsFavouriteMovie(isFavouriteMovie: isFavourite));
    } else if (event is DeleteFavouriteMovieEvent) {
      await deleteFavouriteMovie(event.movieId);
      yield* _fetchAndLoadFavouriteMovies();
    } else if (event is LoadFavouriteMovieEvent)
      yield* _fetchAndLoadFavouriteMovies();
    else if (event is CheckIfFavouriteMovieEvent) {
      final isFavourite = await checkIfFavouriteMovie(event.movieId);

      yield isFavourite.fold(
          (error) => FavouriteMovieError(appErrorType: error.errorType),
          (isFavourite) => IsFavouriteMovie(isFavouriteMovie: isFavourite));
    }
  }

  Stream<FavouriteMovieState> _fetchAndLoadFavouriteMovies() async* {
    final movieList = await getFavouriteMovies(NoParams());

    yield movieList.fold(
        (error) => FavouriteMovieError(appErrorType: error.errorType),
        (movieList) => FavouriteMovieLoaded(movieList: movieList));
  }
}
