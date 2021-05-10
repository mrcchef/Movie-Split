import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie/data/data_sources/movie_local_data_source.dart';

import 'package:flutter_movie/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_movie/data/models/cast_crew_result_data_model.dart';
import 'package:flutter_movie/data/models/movie_detail_model.dart';
import 'package:flutter_movie/data/models/movie_model.dart';
import 'package:flutter_movie/data/tables/movie_table.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/video_entity.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';

// Dartz is a package that provides us feature of Either
// Either is a data-type which contains both failure and success i.e (L,R)
// Left side contains the failure and right contains the success
class MovieRepositoryImpl extends MovieRepository {
  // MovieRemoteDataSource class contains the core methods
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

<<<<<<< HEAD
  MovieRepositoryImpl({this.remoteDataSource, this.localDataSource});
=======
  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      // if we success, then in the right Right() constructor assisgn the movie
      // in the right parameter
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getCommingSoon() async {
    try {
      final movies = await remoteDataSource.getCommingSoon();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getMovieCast(int id) async {
    try {
      final cast = await remoteDataSource.getMovieCast(id);
      return Right(cast);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getMovieVideo(int id) async {
    try {
      final video = await remoteDataSource.getMovieVideo(id);
      return Right(video);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getSearchMovies(
      String seachTerm) async {
    try {
      final movies = await remoteDataSource.getSeachMovies(seachTerm);
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      // else assign left data type through Left() constructor
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<AppError, bool>> checkIfFavouriteMovie(int id) async {
    try {
      final bool response = await localDataSource.checkIfFavouriteMovie(id);
      return Right(response);
    } on Exception catch (e) {
      return Left(AppError(AppErrorType.database));
=======
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies() async {
    try {
      final movies = await localDataSource.getMovie();
      return Right(movies);
    } on Exception {
      return left(AppError(AppErrorType.database));
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<AppError, void>> deleteFavouriteMovie(int id) async {
    try {
      final void response = await localDataSource.deleteFavouriteMovie(id);
      return Right(response);
    } on Exception catch (e) {
=======
  Future<Either<AppError, bool>> checkIfMovieFavourite(int id) async {
    try {
      final response = await localDataSource.checkIfMovieFavourite(id);
      return Right(response);
    } on Exception {
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies() async {
    try {
      final List<MovieEntity> response =
          await localDataSource.getFavouriteMovies();
      return Right(response);
    } on Exception catch (e) {
=======
  Future<Either<AppError, void>> deleteFavouriteMovie(int id) async {
    try {
      final response = await localDataSource.deleteMovie(id);
      return Right(response);
    } on Exception {
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<AppError, void>> saveFavouriteMovie(
      MovieEntity movieEntity) async {
    try {
      final void response = await localDataSource
          .saveFavouriteMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception catch (e) {
=======
  Future<Either<AppError, void>> saveMovie(MovieEntity movie) async {
    try {
      final response = await localDataSource.saveMovie(movie);
      return Right(response);
    } on Exception {
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
      return Left(AppError(AppErrorType.database));
    }
  }
}
