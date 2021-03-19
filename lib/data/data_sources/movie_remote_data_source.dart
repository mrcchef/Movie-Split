import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/data/core/api_clinet.dart';
import 'package:flutter_movie/data/models/movie_detail_model.dart';
import 'package:flutter_movie/data/models/movies_result_model.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/usecases/get_movie_detail.dart';
import 'package:http/http.dart';

import 'package:flutter_movie/data/models/movie_model.dart';
import 'package:flutter_movie/data/core/api_constraint.dart';

// This class is a abstarct class, contains all the Methods
abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
  Future<MovieDetailEntity> getMovieDetail(int id);
}

// This class has all the implimentation of above abstract class
class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final APIClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final responseBody = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final responseBody = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final responseBody = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final responseBody = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final responseBody = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(responseBody);
    print(movie);
    return movie;
  }
}
