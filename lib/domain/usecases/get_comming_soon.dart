import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';

class GetCommingSoon extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;
  GetCommingSoon(this.movieRepository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getCommingSoon();
  }
}
