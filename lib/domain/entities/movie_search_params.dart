import 'package:equatable/equatable.dart';

class MovieSearchParams extends Equatable {
  final String searchTerm;

  MovieSearchParams({required this.searchTerm})
      : assert(searchTerm != null, "search term can not be null");

  @override
  List<Object> get props => [searchTerm];
}
