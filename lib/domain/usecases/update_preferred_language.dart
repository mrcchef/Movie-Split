import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/repositories/app_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class UpdatePreferredLanguage extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdatePreferredLanguage(this.appRepository);
  @override
  Future<Either<AppError, void>> call(String languageCode) async {
    return appRepository.updatePreferredLanguage(languageCode);
  }
}
