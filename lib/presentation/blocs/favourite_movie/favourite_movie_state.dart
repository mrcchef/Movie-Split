part of 'favourite_movie_bloc.dart';

abstract class FavouriteMovieState extends Equatable {
  const FavouriteMovieState();

  @override
  List<Object> get props => [];
}

class FavouriteMovieInitial extends FavouriteMovieState {}

class FavouriteMovieLoaded extends FavouriteMovieState {
  final List<MovieEntity> movieList;

  FavouriteMovieLoaded({this.movieList});

  @override
  List<Object> get props => [movieList];
}

class FavouriteMovieError extends FavouriteMovieState {
  final AppErrorType appErrorType;

  FavouriteMovieError({this.appErrorType});

  @override
  List<Object> get props => [appErrorType];
}

class IsFavouriteMovie extends FavouriteMovieState {
  final bool isFavouriteMovie;

  IsFavouriteMovie({this.isFavouriteMovie});

  @override
  List<Object> get props => [isFavouriteMovie];
}
