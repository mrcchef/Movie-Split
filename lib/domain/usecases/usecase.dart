import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';

// It is the abstract class which has a method call()
// We have created this class to maintain the uniformatity such that in future
// someone wants to create another usecase then he knows that is the
// stucture of creating use case is used in the project

// <Type,Params>
// Here Type is the type of data that we will be returing through call()
// Params represent a class which contain all the required parameter that we need
// in order to get the data
// We have created a class that has all the parameter in order to make our app
// feasible b/c if we have few arguments then we can directly pass it but if
// we have large number of arguments the passing them in the constrcutor in bit
// time consuming and complex
// Baisc idea is to return any type of data and if a call returned some paramiter
// then we can also pass them

// Usecases directly interact with our bloc
// They are very simple class that take inputs and returns output accordingly

// With the help of use case we invoke the methods that are there in the
// movie repository

// This class is extended by all the use cases in the project
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
