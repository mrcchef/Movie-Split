part of 'movie_video_bloc.dart';

abstract class MovieVideoState extends Equatable {
  const MovieVideoState();

  @override
  List<Object> get props => [];
}

class MovieVideoInitial extends MovieVideoState {}

class MovieVideoLoaded extends MovieVideoState {
  final List<VideoEntity> videos;

  MovieVideoLoaded({@required this.videos});

  @override
  List<Object> get props => [videos];
}

class MovieVideoError extends MovieVideoState {
  final AppErrorType appErrorType;
  MovieVideoError({this.appErrorType, tabIndex});
}
