import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_cast_entity.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/movie_search_params.dart';
import 'package:flutter_movie/domain/entities/video_entity.dart';

// In order to seprate domain layer and data layer we returns entity instead of model

//This class contains all the methods and also handling the errors
// This is a abstract class and we have one more file of it's implementation
abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getCommingSoon();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<MovieCastEntity>>> getMovieCast(int id);
  Future<Either<AppError, List<VideoEntity>>> getMovieVideo(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchMovies(
      String searchTerm);
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies();
  Future<Either<AppError, void>> deleteFavouriteMovie(int id);
  Future<Either<AppError, bool>> checkIfMovieFavourite(int id);
  Future<Either<AppError, void>> saveMovie(MovieEntity movie);
}
