part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavouriteMoviesEvent extends FavouriteEvent {}

class DeleteFavouriteMovieEvent extends FavouriteEvent {
  final int movieId;

  DeleteFavouriteMovieEvent({@required this.movieId})
      : assert(movieId != null, "movieId can not be null");

  @override
  List<Object> get props => [movieId];
}

class ToggleFavouriteMovieEvent extends FavouriteEvent {
  final MovieEntity movieEntity;
  final bool isFavourite;

  ToggleFavouriteMovieEvent({
    @required this.movieEntity,
    @required this.isFavourite,
  }) : assert(movieEntity != null, "movieEntity can not be null");

  @override
  List<Object> get props => [movieEntity, isFavourite];
}

class CheckIfFavouriteMovieEvent extends FavouriteEvent {
  final int movieId;

  CheckIfFavouriteMovieEvent({@required this.movieId})
      : assert(movieId != null, "isFavourite can not be null");
}
