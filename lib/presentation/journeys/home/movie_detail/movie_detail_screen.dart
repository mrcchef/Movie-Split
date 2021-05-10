import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
<<<<<<< HEAD
import 'package:flutter_movie/presentation/blocs/favourite_movie/favourite_movie_bloc.dart';
=======
import 'package:flutter_movie/presentation/blocs/favourite/favourite_bloc.dart';
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
import 'package:flutter_movie/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_video/movie_video_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/big_poster.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/cast_widget.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_args.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/video_widget.dart';
import 'package:flutter_movie/presentation/widgets/app_error_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArgs movieDetailArgs;

  const MovieDetailScreen({Key key, @required this.movieDetailArgs})
      : assert(
            movieDetailArgs != null, "movie detail arguments can not be null"),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;
  MovieCastBloc _movieCastBloc;
  MovieVideoBloc _movieVideoBloc;
<<<<<<< HEAD
  FavouriteMovieBloc _favouriteMovieBloc;
=======
  FavouriteBloc _favouriteBloc;
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08

  @override
  void initState() {
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _movieCastBloc = _movieDetailBloc.movieCastBloc;
    _movieVideoBloc = _movieDetailBloc.movieVideoBloc;
<<<<<<< HEAD
    _favouriteMovieBloc = _movieDetailBloc.favouriteMovieBloc;

=======
    _favouriteBloc = _movieDetailBloc.favouriteBloc;
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
    _movieDetailBloc
        .add(MovieDetailLoadEvent(movieId: widget.movieDetailArgs.movieId));
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _movieCastBloc?.close();
    _movieVideoBloc?.close();
<<<<<<< HEAD
    _favouriteMovieBloc?.close();
=======
    _favouriteBloc?.close();
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
    super.dispose();
  }
  // So we  have two method of BlocProvider<T>
  // 1st -> BlocProvider<T>(create: <takes a function that returns a bloc>, child: null)
  // 2ns -> BlocProvider<T>.value(value: <takes instace of bloc>, child: null)

  // Now, We know BlocProvider is used to pass the instance of bloc to this
  // child widget but when we use Navigator.of(context) we actually chaning the
  // screen due to which in the 1st method instance of bloc will be disposed
  // But if we need bloc in more that one screen then we should use 2nd method
  // and manually dispose the instance of bloc in the dispose();

  // 2nd method is better and we should use it and manually in every class we
  // shold override dispose() and close our instances

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _movieCastBloc),
          BlocProvider.value(value: _movieVideoBloc),
<<<<<<< HEAD
          BlocProvider.value(value: _favouriteMovieBloc),
=======
          BlocProvider.value(value: _favouriteBloc),
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (ctx, state) {
            if (state is MovieDetailLoaded) {
              final movie = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    BigPoster(movieDetailEntity: movie),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16, vertical: Sizes.dimen_8),
                      child: Text(
                        movie.overview,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16,
                        vertical: Sizes.dimen_8,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Cast",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    CastWidget(),
                    VideoWidget(),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return AppErrorWidget(
                  appErrorType: AppErrorType.api, onPressed: () {});
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
