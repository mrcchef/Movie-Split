import 'package:flutter_movie/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepositoryImpl authenticateRepositoryImpl;

  LogoutUser(this.authenticateRepositoryImpl);

  @override
  Future<Either<AppError, void>> call(NoParams noParams) async {
    return await authenticateRepositoryImpl.logoutUser();
  }
}
