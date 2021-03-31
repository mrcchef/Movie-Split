import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/movie_search_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class GetSearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository movieRepository;
  GetSearchMovies(this.movieRepository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams params) async {
    return await movieRepository.getSearchMovies(params.searchTerm);
  }
}
