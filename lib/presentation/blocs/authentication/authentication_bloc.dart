import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/login_request_params.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/login_user.dart';
import 'package:flutter_movie/domain/usecases/logout_user.dart';
import 'package:flutter_movie/presentation/blocs/loading/loading_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final LoadingBloc loadingBloc;

  AuthenticationBloc(
      {@required this.loginUser,
      @required this.logoutUser,
      @required this.loadingBloc})
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoginInitiateEvent) {
      loadingBloc.add(LoadingStartEvent());
      final eitherResponse = await loginUser(
        LoginRequestParams(username: event.username, password: event.password),
      );

      yield eitherResponse.fold((error) {
        final String message = _getErrorMessage(error.errorType);
        print('message:$message');
        return AuthenticationError(message: message);
      }, (r) {
        print("Success");
        return LoginSuccess();
      });
      loadingBloc.add(LoadingEndEvent());
    } else if (event is LogoutEvent) {
      await logoutUser(NoParams());
      print("now yielding logout success");
      yield LogoutSuccess();
    }
  }

  String _getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return 'No network connection';
      case AppErrorType.api:
      case AppErrorType.database:
        return 'Something went wrong...';
      case AppErrorType.sessionDenied:
        return 'Session denied';
      default:
        return 'Username or email id is invalid';
    }
  }
}
