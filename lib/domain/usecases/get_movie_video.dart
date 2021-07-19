import 'package:dartz/dartz.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:flutter_movie/domain/entities/video_entity.dart';
import 'package:flutter_movie/domain/usecases/usecase.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';

class GetMovieVideo extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository movieRepository;

  GetMovieVideo(this.movieRepository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
    return await movieRepository.getMovieVideo(params.id);
  }
}
