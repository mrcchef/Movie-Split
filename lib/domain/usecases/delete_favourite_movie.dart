import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class DeleteFavouriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository movieRepository;

  DeleteFavouriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams params) async {
    return await movieRepository.deleteFavouriteMovie(params.id);
  }
}
