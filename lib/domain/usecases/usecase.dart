import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';

// It is the abstract class which has a method call()
// We have created this class to maintain the uniformatity such that in future
// someone wants to create another usecase then he knows that is the
// stucture of creating use case is used in the project

// Not very good idea about <Type,Params>
// Baisc idea is to return any type of data and if a call retuired some paramiter
// then we can also pass them

// This class is extended by all the use cases in the project
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
