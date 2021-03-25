part of 'movie_cast_bloc.dart';

abstract class MovieCastEvent extends Equatable {
  const MovieCastEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieCastEvent extends MovieCastEvent {
  final int movieId;

  LoadMovieCastEvent({@required this.movieId})
      : assert(movieId != null, "movie Id can not be null");

  @override
  List<Object> get props => [movieId];
}
