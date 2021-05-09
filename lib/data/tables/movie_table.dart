import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:hive/hive.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String posterPath;

  @HiveField(2)
  final String title;

  MovieTable({this.id, this.posterPath, this.title})
      : super(
          id: id,
          posterPath: posterPath,
          title: title,
          overview: '',
          backdropPath: '',
          releaseDate: '',
          voteAverage: 0,
        );

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
        id: movieEntity.id,
        posterPath: movieEntity.posterPath,
        title: movieEntity.title);
  }
}
