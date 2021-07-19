import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/domain/entities/no_params.dart';
import 'package:flutter_movie/domain/usecases/get_comming_soon.dart';
import 'package:flutter_movie/domain/usecases/get_playing_now.dart';
import 'package:flutter_movie/domain/usecases/get_popular.dart';
import 'package:flutter_movie/presentation/blocs/loading/loading_cubit.dart';

part 'movie_tapped_event.dart';
part 'movie_tapped_state.dart';

class MovieTappedBloc extends Bloc<MovieTappedEvent, MovieTappedState> {
  final GetCommingSoon getCommingSoon;
  final GetPopular getPopular;
  final GetNowPlaying getNowPlaying;
  final LoadingCubit loadingCubit;

  MovieTappedBloc({
    required this.getCommingSoon,
    required this.getPopular,
    required this.getNowPlaying,
    required this.loadingCubit,
  }) : super(MovieTappedInitial());

  @override
  Stream<MovieTappedState> mapEventToState(
    MovieTappedEvent event,
  ) async* {
    if (event is TabChangedEvent) {
      yield MovieTappedLoadingState(tabIndex: event.tabIndex);
      await Future.delayed(new Duration(seconds: 2));
      Either<AppError, List<MovieEntity>> eitherResponse;
      switch (event.tabIndex) {
        case 0:
          eitherResponse = await getPopular(NoParams());
          break;
        case 1:
          eitherResponse = await getNowPlaying(NoParams());
          break;
        case 2:
          eitherResponse = await getCommingSoon(NoParams());
          break;
      }

      yield eitherResponse.fold(
          (error) => MovieTappedError(
                appErrorType: error.errorType,
                tabIndex: event.tabIndex,
              ),
          (movies) => MovieTappedLoaded(
                tabIndex: event.tabIndex,
                movies: movies,
              ));
    }
  }
}
