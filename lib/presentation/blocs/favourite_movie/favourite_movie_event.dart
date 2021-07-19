part of 'favourite_movie_bloc.dart';

abstract class FavouriteMovieEvent extends Equatable {
  const FavouriteMovieEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavouriteMovieEvent extends FavouriteMovieEvent {
  final MovieEntity movieEntity;
  final bool isFavourite;

  ToggleFavouriteMovieEvent(
      {required this.movieEntity, required this.isFavourite});

  @override
  List<Object> get props => [movieEntity, isFavourite];
}

class DeleteFavouriteMovieEvent extends FavouriteMovieEvent {
  final int movieId;

  DeleteFavouriteMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class LoadFavouriteMovieEvent extends FavouriteMovieEvent {
  @override
  List<Object> get props => [];
}

class CheckIfFavouriteMovieEvent extends FavouriteMovieEvent {
  final int movieId;

  CheckIfFavouriteMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
