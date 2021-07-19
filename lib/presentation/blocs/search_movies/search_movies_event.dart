part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchMovie extends SearchMoviesEvent {
  final String searchTerm;

  LoadSearchMovie({required this.searchTerm});
}
