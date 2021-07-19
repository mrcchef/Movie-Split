import 'package:flutter_movie/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/login_request_params.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepositoryImpl authenticateRepositoryImpl;

  LoginUser(this.authenticateRepositoryImpl);

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async {
    return await authenticateRepositoryImpl.loginUser(params.toJson());
  }
}
