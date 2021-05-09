import 'package:flutter_movie/data/tables/movie_table.dart';
import 'package:flutter_movie/domain/entities/movie_params.dart';
import 'package:hive/hive.dart';

import 'package:flutter_movie/common/constants/global.dart' as global;

abstract class MovieLocalDataSource {
  Future<List<MovieTable>> getFavouriteMovies();
  Future<void> deleteFavouriteMovie(int movieId);
  Future<bool> checkIfFavouriteMovie(int movieId);
  Future<void> saveFavouriteMovie(MovieTable movieTable);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
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
  }
}
