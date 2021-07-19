part of 'movie_video_bloc.dart';

abstract class MovieVideoEvent extends Equatable {
  const MovieVideoEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieVideo extends MovieVideoEvent {
  final int movieId;

  LoadMovieVideo({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
