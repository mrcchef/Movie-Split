import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_movie/data/core/unauthourized_exception.dart';
import 'package:flutter_movie/data/data_sources/authentication_local_data_source.dart';
import 'package:flutter_movie/data/data_sources/authentication_remote_data_source.dart';
import 'package:flutter_movie/data/models/request_token_model.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/repositories/authentication_respository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSourceImpl authenticationRemoteDataSourceImpl;
  final AuthenticationLocalDataSourceImpl authenticationLocalDataSourceImpl;

  AuthenticationRepositoryImpl(
      {@required this.authenticationRemoteDataSourceImpl,
      @required this.authenticationLocalDataSourceImpl});

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final RequestTokenModel requestTokenModel =
          await authenticationRemoteDataSourceImpl.getRequestToken();
      return Right(requestTokenModel);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
    final requestTokenEitherModel = await _getRequestToken();

    // getOrElse method supply default value when left object is retured
    // here default value is returned from the method in method getOrElse()
    // Here if ? ...
    final token =
        requestTokenEitherModel.getOrElse(() => null)?.requestToken ?? '';

    try {
      params.putIfAbsent('request_token', () => token);
      // In Tmdb if request token is empty then also it will written success
      // but with empty session id
      final responseBody = await authenticationRemoteDataSourceImpl
          .validateWidgetLogin(requestBody: params);

      final sessionId = await authenticationRemoteDataSourceImpl.createSession(
          requestBody: responseBody.toJson());
      print('session id: $sessionId');
      if (sessionId != null) {
        // suession created
        // saved to local database also
        await authenticationLocalDataSourceImpl.saveSessionId(sessionId);
        return Right(true);
      }
      return Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthourizedException {
      return Left(AppError(AppErrorType.unauthourized));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final String sessionId =
        await authenticationLocalDataSourceImpl.getSessionId();

    await Future.wait([
      authenticationLocalDataSourceImpl.deleteSesstionId(sessionId),
      authenticationRemoteDataSourceImpl.deleteSession(sessionId)
    ]);

    print(await authenticationLocalDataSourceImpl.getSessionId());

    return Right(Unit);
  }
}
