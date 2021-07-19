import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/data/data_sources/movie_language_data_source.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final MovieLanguageDataSource movieLanguageDataSource;

  AppRepositoryImpl({required this.movieLanguageDataSource});

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final reponse = await movieLanguageDataSource.getPreferredLanguage();
      return Right(reponse);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updatePreferredLanguage(
      String languageCode) async {
    try {
      final reponse =
          await movieLanguageDataSource.updatePreferredLanguage(languageCode);
      return Right(reponse);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
}
