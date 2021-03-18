import 'package:equatable/equatable.dart';

enum AppErrorType { api, network }

// This is a simple class that contains error message
class AppError extends Equatable {
  final AppErrorType errorType;
  const AppError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
