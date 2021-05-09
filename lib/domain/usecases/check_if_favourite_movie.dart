import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class CheckIfFavouriteMovie extends UseCase<bool, int> {
  final MovieRepository movieRepository;

  CheckIfFavouriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(int movieId) async {
    return await movieRepository.checkIfFavouriteMovie(movieId);
  }
}
