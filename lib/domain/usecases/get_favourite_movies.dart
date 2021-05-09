import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class GetFavouriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavouriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getFavouriteMovies();
  }
}
