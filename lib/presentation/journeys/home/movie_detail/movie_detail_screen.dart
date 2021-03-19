import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/big_poster.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_args.dart';
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

  @override
  void initState() {
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _movieDetailBloc
        .add(MovieDetailLoadEvent(movieId: widget.movieDetailArgs.movieId));
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>(
        create: (_) => _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (ctx, state) {
            if (state is MovieDetailLoaded) {
              final movie = state.movieDetailEntity;
              return Column(
                children: [
                  BigPoster(movieDetailEntity: movie),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
                    child: Text(
                      movie.overview,
                      maxLines: 5,
                    ),
                  ),
                ],
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
