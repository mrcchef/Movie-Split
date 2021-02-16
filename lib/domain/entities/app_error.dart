import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

// This is a simple class that contains error message
class AppError extends Equatable {
  final String message;
  AppError(this.message);

  @override
  List<Object> get props => [message];
}
