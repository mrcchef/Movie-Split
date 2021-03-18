import 'package:flutter/material.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_crousel/movie_crousel_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_tapped/movie_tapped_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/drawer/navigation_drawer.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/crousel_load_error_widget.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/movie_crousel_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/movie_tapped_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCrouselBloc movieCrouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTappedBloc movieTappedBloc;

  @override
  void initState() {
    super.initState();
    movieCrouselBloc = getItInstance<MovieCrouselBloc>();
    movieBackdropBloc = movieCrouselBloc.movieBackdropBloc;
    movieTappedBloc = getItInstance<MovieTappedBloc>();
    // movieCrouselBloc = movieCrouselBloc.movie;
    movieCrouselBloc.add(CrouselLoadEvent());
  }

  void dispose() {
    super.dispose();
    movieCrouselBloc?.close();
    movieBackdropBloc?.close();
    movieTappedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCrouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider(
          create: (context) => movieTappedBloc,
        )
      ],
      child: Scaffold(
        body: BlocBuilder<MovieCrouselBloc, MovieCrouselState>(
          bloc: movieCrouselBloc,
          builder: (context, state) {
            if (state is MovieCrouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCrouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: MovieTappedWidget()),
                ],
              );
            } else if (state is MovieCrouselError) {
              return CrouselLoadErrorWidget(
                appErrorType: state.errorType,
                onPressed: () {
                  movieCrouselBloc.add(CrouselLoadEvent());
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
        drawer: NavigationDrawer(),
      ),
    );
  }
}
