part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesError extends SearchMoviesState {
  final AppErrorType appErrorType;
  SearchMoviesError({this.appErrorType});
}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<MovieEntity> movies;

  SearchMoviesLoaded({@required this.movies});
}
