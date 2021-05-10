<<<<<<< HEAD
import 'package:flutter_movie/data/tables/movie_table.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:hive/hive.dart';

import 'package:flutter_movie/common/constants/global.dart' as global;

abstract class MovieLocalDataSource {
  Future<List<MovieTable>> getFavouriteMovies();
  Future<void> deleteFavouriteMovie(int movieId);
  Future<bool> checkIfFavouriteMovie(int movieId);
  Future<void> saveFavouriteMovie(MovieTable movieTable);
=======
import 'package:flutter_movie/data/tabels/movie_table.dart';
import 'package:hive/hive.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<void> deleteMovie(int movieId);
  Future<List<MovieTable>> getMovie();
  Future<bool> checkIfMovieFavourite(int movieId);
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
<<<<<<< HEAD
  Future<bool> checkIfFavouriteMovie(int movieId) async {
    Box box = await Hive.openBox(global.movieBox);
    return box.containsKey(movieId);
  }

  @override
  Future<void> deleteFavouriteMovie(int movieId) async {
    Box box = await Hive.openBox(global.movieBox);
    box.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getFavouriteMovies() async {
    Box box = await Hive.openBox(global.movieBox);
    final ids = box.keys;
    List<MovieTable> movieList = [];
    ids.forEach((element) {
      movieList.add(box.get(element));
    });

    return movieList;
  }

  @override
  Future<void> saveFavouriteMovie(MovieTable movieTable) async {
    Box box = await Hive.openBox(global.movieBox);
    box.put(movieTable.id, movieTable);
=======
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
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
  }
}
