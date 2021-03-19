part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailLoadEvent extends MovieDetailEvent {
  final int movieId;

  MovieDetailLoadEvent({@required this.movieId})
      : assert(movieId != null, "movie id can not be null");

  @override
  List<Object> get props => [movieId];
}
