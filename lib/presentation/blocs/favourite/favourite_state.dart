part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteMoviesLoaded extends FavouriteState {
  final List<MovieEntity> movies;

  FavouriteMoviesLoaded({@required this.movies})
      : assert(movies != null, "movies can not be null");

  @override
  List<Object> get props => [movies];
}

class FavouriteMovieError extends FavouriteState {
  final AppErrorType appErrorType;
  FavouriteMovieError({@required this.appErrorType});

  @override
  List<Object> get props => [appErrorType];
}

class IsFavouriteMovie extends FavouriteState {
  final bool isFavourite;

  IsFavouriteMovie({@required this.isFavourite})
      : assert(isFavourite != null, "isFavourite can not be null");

  @override
  List<Object> get props => [isFavourite];
}
