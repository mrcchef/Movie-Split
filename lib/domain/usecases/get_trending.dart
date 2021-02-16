import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';

// Usecases are the file that contains the calling implementation of the method
// call() is a methods that is there for every class and call() method is executed
// with the instance only
// For demonstration look in the main file
class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;
  GetTrending(this.movieRepository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getTrending();
  }
}
