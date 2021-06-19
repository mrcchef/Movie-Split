import 'package:flutter_movie/data/data_sources/authentication_local_data_source.dart';
import 'package:flutter_movie/data/data_sources/authentication_remote_data_source.dart';
import 'package:flutter_movie/data/data_sources/movie_language_data_source.dart';
import 'package:flutter_movie/data/data_sources/movie_local_data_source.dart';
import 'package:flutter_movie/data/repositories/app_repository_impl.dart';
import 'package:flutter_movie/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_movie/domain/repositories/app_repository.dart';
import 'package:flutter_movie/domain/repositories/authentication_respository.dart';
import 'package:flutter_movie/domain/usecases/check_if_favourite_movie.dart';
import 'package:flutter_movie/domain/usecases/delete_favourite_movie.dart';
import 'package:flutter_movie/domain/usecases/get_favourite_movies.dart';
import 'package:flutter_movie/domain/usecases/get_movie_cast.dart';
import 'package:flutter_movie/domain/usecases/get_movie_detail.dart';
import 'package:flutter_movie/domain/usecases/get_movie_video.dart';
import 'package:flutter_movie/domain/usecases/get_preferred_language.dart';
import 'package:flutter_movie/domain/usecases/get_seach_movies.dart';
import 'package:flutter_movie/domain/usecases/login_user.dart';
import 'package:flutter_movie/domain/usecases/logout_user.dart';
import 'package:flutter_movie/domain/usecases/save_favourite_movie.dart';
import 'package:flutter_movie/domain/usecases/update_preferred_language.dart';
import 'package:flutter_movie/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_movie/presentation/blocs/favourite_movie/favourite_movie_bloc.dart';
import 'package:flutter_movie/presentation/blocs/language/language_bloc.dart';
import 'package:flutter_movie/presentation/blocs/loading/loading_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_crousel/movie_crousel_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_tapped/movie_tapped_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_video/movie_video_bloc.dart';
import 'package:flutter_movie/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:flutter_movie/data/repositories/movie_repository_impl.dart';

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

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  getItInstance.registerLazySingleton<MovieLanguageDataSource>(
      () => MovieLanguageDataSourceImpl());

  getItInstance.registerLazySingleton<AuthenticationLocalDataSourceImpl>(
      () => AuthenticationLocalDataSourceImpl());

  getItInstance.registerLazySingleton<AuthenticationRemoteDataSourceImpl>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(() =>
      MovieRepositoryImpl(
          localDataSource: getItInstance(), remoteDataSource: getItInstance()));

  getItInstance.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(movieLanguageDataSource: getItInstance()));

  getItInstance.registerLazySingleton<AuthenticationRepositoryImpl>(
    () => AuthenticationRepositoryImpl(
      authenticationLocalDataSourceImpl: getItInstance(),
      authenticationRemoteDataSourceImpl: getItInstance(),
    ),
  );

  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));

  getItInstance
      .registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetCommingSoon>(
      () => GetCommingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetNowPlaying>(
      () => GetNowPlaying(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  getItInstance
      .registerLazySingleton<GetMovieCast>(() => GetMovieCast(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieVideo>(
      () => GetMovieVideo(getItInstance()));

  getItInstance.registerLazySingleton<GetSearchMovies>(
      () => GetSearchMovies(getItInstance()));

  getItInstance.registerLazySingleton<GetFavouriteMovies>(
      () => GetFavouriteMovies(getItInstance()));

  getItInstance.registerLazySingleton<SaveFavouriteMovie>(
      () => SaveFavouriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavouriteMovie>(
      () => DeleteFavouriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavouriteMovie>(
      () => CheckIfFavouriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance.registerLazySingleton<UpdatePreferredLanguage>(
      () => UpdatePreferredLanguage(getItInstance()));

  // Factory methods registers a new object every time it is called in the application
  getItInstance.registerFactory<MovieCrouselBloc>(() => MovieCrouselBloc(
      getTrending: getItInstance(), movieBackdropCubit: getItInstance()));

  getItInstance.registerFactory<MovieBackdropCubit>(() => MovieBackdropCubit());

  getItInstance.registerFactory<MovieTappedBloc>(
    () => MovieTappedBloc(
      getCommingSoon: getItInstance(),
      getNowPlaying: getItInstance(),
      getPopular: getItInstance(),
      loadingBloc: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<LanguageCubit>(
    () => LanguageCubit(
      getPreferredLanguage: getItInstance(),
      updatePreferredLanguage: getItInstance(),
    ),
  );

  getItInstance.registerFactory<MovieCastBloc>(
      () => MovieCastBloc(getMovieCast: getItInstance()));

  getItInstance.registerFactory<MovieVideoBloc>(
      () => MovieVideoBloc(movieRepository: getItInstance()));

  getItInstance.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(
        getMovieDetail: getItInstance(),
        movieCastBloc: getItInstance(),
        movieVideoBloc: getItInstance(),
        favouriteMovieBloc: getItInstance(),
        loadingBloc: getItInstance(),
      ));

  getItInstance.registerFactory<SearchMoviesBloc>(
      () => SearchMoviesBloc(movieRepository: getItInstance()));

  getItInstance.registerFactory<FavouriteMovieBloc>(
    () => FavouriteMovieBloc(
      getFavouriteMovies: getItInstance(),
      checkIfFavouriteMovie: getItInstance(),
      deleteFavouriteMovie: getItInstance(),
      saveFavouriteMovie: getItInstance(),
    ),
  );

  getItInstance.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(
      loginUser: getItInstance(),
      logoutUser: getItInstance(),
      loadingBloc: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<LoadingBloc>(() => LoadingBloc());
}
