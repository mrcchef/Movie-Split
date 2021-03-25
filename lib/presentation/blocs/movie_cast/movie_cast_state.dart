part of 'movie_cast_bloc.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

class MovieCastInitial extends MovieCastState {}

class MovieCastLoaded extends MovieCastState {
  final List<MovieCastEntity> cast;

  MovieCastLoaded({@required this.cast});

  @override
  List<Object> get props => [cast];
}

class MovieCastError extends MovieCastState {
  final AppErrorType appErrorType;

  MovieCastError({@required this.appErrorType});

  @override
  List<Object> get props => [appErrorType];
}
