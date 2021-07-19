part of 'movie_crousel_bloc.dart';

abstract class MovieCrouselState extends Equatable {
  const MovieCrouselState();

  @override
  List<Object> get props => [];
}

class MovieCrouselInitial extends MovieCrouselState {}

class MovieCrouselError extends MovieCrouselState {
  final AppErrorType errorType;

  MovieCrouselError({required this.errorType});
}

class MovieCrouselLoaded extends MovieCrouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCrouselLoaded({
    required this.movies,
    required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'default index should be greater than 0');

  List<Object> get props => [movies, defaultIndex];
}
