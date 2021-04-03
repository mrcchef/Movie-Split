import 'package:flutter_movie/data/tabels/movie_table.dart';
import 'package:hive/hive.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<void> deleteMovie(int movieId);
  Future<List<MovieTable>> getMovie();
  Future<bool> checkIfMovieFavourite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkIfMovieFavourite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getMovie() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieTable = [];
    final keys = movieBox.keys;
    keys.forEach((key) {
      movieTable.add(movieBox.get(key));
    });
    return movieTable;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    movieBox.put(movieTable.id, movieTable);
  }
}
