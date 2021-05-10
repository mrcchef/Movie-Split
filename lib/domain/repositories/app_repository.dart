import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, String>> getPreferredLanguage();
  Future<Either<AppError, void>> updatePreferredLanguage(String languageCode);
}
