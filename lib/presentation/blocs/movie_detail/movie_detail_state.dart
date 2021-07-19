part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailLoaded({required this.movieDetailEntity});

  @override
  List<Object> get props => [movieDetailEntity];
}

class MovieDetailError extends MovieDetailState {}
