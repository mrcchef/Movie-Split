import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_cast_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class GetMovieCast extends UseCase<List<MovieCastEntity>, MovieParams> {
  final MovieRepository movieRepository;
  GetMovieCast(this.movieRepository);

  Future<Either<AppError, List<MovieCastEntity>>> call(
      MovieParams movieParams) async {
    return await movieRepository.getMovieCast(movieParams.id);
  }
}
