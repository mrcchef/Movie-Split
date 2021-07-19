import 'package:flutter_movie/data/core/api_clinet.dart';
import 'package:flutter_movie/data/models/cast_crew_result_data_model.dart';
import 'package:flutter_movie/data/models/movie_detail_model.dart';
import 'package:flutter_movie/data/models/movies_result_model.dart';
import 'package:flutter_movie/data/models/video_result_data_model.dart';

import 'package:flutter_movie/data/models/movie_model.dart';

// This class is a abstarct class, contains all the Methods
abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
  Future<List<MovieModel>> getSeachMovies(String seachTerm);
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getMovieCast(int id);
  Future<List<VideoModel>> getMovieVideo(int id);
}

// This class has all the implimentation of above abstract class
class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final APIClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final responseBody = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    // print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final responseBody = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    // print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final responseBody = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    // print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final responseBody = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    // print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final responseBody = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(responseBody);
    if (_isValidMovieDetail(movie)) {
      return movie;
    }
    throw Exception();
  }

  bool _isValidMovieDetail(MovieDetailModel movie) {
    return movie.id > 0 &&
        movie.title.isNotEmpty &&
        movie.posterPath.isNotEmpty;
  }

  @override
  Future<List<CastModel>> getMovieCast(int id) async {
    final responseBody = await _client.get('movie/$id/credits');
    final cast = CastCrewResultDataModel.fromJson(responseBody).cast;
    // print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>> getMovieVideo(int id) async {
    final responseBody = await _client.get('movie/$id/videos');
    final videos = VideoResultDataModel.fromJson(responseBody).videos;
    // print(videos);
    return videos;
  }

  @override
  Future<List<MovieModel>> getSeachMovies(String seachTerm) async {
    final responseBody =
        await _client.get('search/movie', params: {'query': seachTerm});
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    // print(movies);
    return movies;
  }
}
