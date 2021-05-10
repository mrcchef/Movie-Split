import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
<<<<<<< HEAD
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class CheckIfFavouriteMovie extends UseCase<bool, int> {
=======
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class CheckIfFavouriteMovie extends UseCase<bool, MovieParams> {
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
  final MovieRepository movieRepository;

  CheckIfFavouriteMovie(this.movieRepository);

  @override
<<<<<<< HEAD
  Future<Either<AppError, bool>> call(int movieId) async {
    return await movieRepository.checkIfFavouriteMovie(movieId);
=======
  Future<Either<AppError, bool>> call(MovieParams params) async {
    return await movieRepository.checkIfMovieFavourite(params.id);
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
  }
}
