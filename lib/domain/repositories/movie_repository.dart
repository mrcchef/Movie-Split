import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';

//This class contains all the methods and also handling the errors
// This is a abstract class and we have one more file of it's implementation
abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getCommingSoon();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
}
