import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:flutter_movie/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_movie/data/models/cast_crew_result_data_model.dart';
import 'package:flutter_movie/data/models/movie_detail_model.dart';
import 'package:flutter_movie/data/models/movie_model.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_cast_entity.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_search_params.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/video_entity.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/get_movie_cast.dart';

// Dartz is a package that provides us feature of Either
// Either is a data-type which contains both failure and success i.e (L,R)
// Left side contains the failure and right contains the success
class MovieRepositoryImpl extends MovieRepository {
  // MovieRemoteDataSource class contains the core methods
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

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
}
