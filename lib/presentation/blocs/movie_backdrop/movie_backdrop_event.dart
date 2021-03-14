part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackdropChangeEvent extends MovieBackdropEvent {
  final MovieEntity movie;
  MovieBackdropChangeEvent({this.movie})
      : assert(movie != null, "movie can not be null");
  @override
  List<Object> get props => [movie];
}
