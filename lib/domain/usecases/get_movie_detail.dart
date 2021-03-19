import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository movieRepository;
  GetMovieDetail(this.movieRepository);

  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await movieRepository.getMovieDetail(movieParams.id);
  }
}
