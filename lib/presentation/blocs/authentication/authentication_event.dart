part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginInitiateEvent extends AuthenticationEvent {
  final String username;
  final String password;
  LoginInitiateEvent({required this.password, required this.username});
  @override
  List<Object> get props => [username, password];
}

class LogoutEvent extends AuthenticationEvent {}
