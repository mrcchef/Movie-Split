import 'package:flutter_movie/domain/usecases/get_movie_cast.dart';
import 'package:flutter_movie/domain/usecases/get_movie_detail.dart';
import 'package:flutter_movie/domain/usecases/get_movie_video.dart';
import 'package:flutter_movie/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_crousel/movie_crousel_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_tapped/movie_tapped_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_video/movie_video_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/language/language_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:flutter_movie/data/core/api_clinet.dart';
import 'package:flutter_movie/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_movie/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie/domain/repositories/movie_repository.dart';
import 'package:flutter_movie/domain/usecases/get_comming_soon.dart';
import 'package:flutter_movie/domain/usecases/get_playing_now.dart';
import 'package:flutter_movie/domain/usecases/get_popular.dart';
import 'package:flutter_movie/domain/usecases/get_trending.dart';

final getItInstance = GetIt.I; // To get the instance of GetIt

// As we know calling for one class depends upon different class
// eg to call APIClinet you need to pass Client object i.e you first need to
// create the object of Client

// And we have other many dependencies and in order to manange them and not to
// instanciated dependent class we uses a pacakag clalled "Get_it"

// THis package manages the instanciation of all the dependencies of the class

Future init() async {
  // registerLazySingletion intializes the Object of class when it is first
  // accessed in the project
  // Corner barces contains the type of Object that we need to intialize
  // In the paramenter it takes a factory function which intializes the
  // Class
  // registerSingleton and registerLazySingleton both creates a single instance
  // of the class throughout the appilcation
  // Lazy saves memory and resources by initialising it when it calls the very
  // first time.

  // If that instansciation of that class depends upon some other class then
  // we simple use class the instance of the class GetIT and in our case
  // it is getItInstance()

  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<APIClient>(() => APIClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetCommingSoon>(
      () => GetCommingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetNowPlaying>(
      () => GetNowPlaying(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  getItInstance
      .registerLazySingleton<GetMovieCast>(() => GetMovieCast(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieVideo>(
      () => GetMovieVideo(getItInstance()));

  // Factory methods registers a new object every time it is called in the application
  getItInstance.registerFactory<MovieCrouselBloc>(() => MovieCrouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));

  getItInstance.registerFactory<MovieBackdropBloc>(() => MovieBackdropBloc());

  getItInstance.registerFactory<MovieTappedBloc>(() => MovieTappedBloc(
        getCommingSoon: getItInstance(),
        getNowPlaying: getItInstance(),
        getPopular: getItInstance(),
      ));

  getItInstance.registerLazySingleton<LanguageBloc>(() => LanguageBloc());

  getItInstance.registerFactory<MovieCastBloc>(
      () => MovieCastBloc(getMovieCast: getItInstance()));

  getItInstance.registerFactory<MovieVideoBloc>(
      () => MovieVideoBloc(movieRepository: getItInstance()));

  getItInstance.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(
        getMovieDetail: getItInstance(),
        movieCastBloc: getItInstance(),
        movieVideoBloc: getItInstance(),
      ));

  // getItInstance
  //     .registerLazySingleton<MovieBackdropBloc>(() => MovieBackdropBloc());
}
