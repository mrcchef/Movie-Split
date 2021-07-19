import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/presentation/blocs/favourite_movie/favourite_movie_bloc.dart';

import 'favourite_movie_grid_view.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late FavouriteMovieBloc _favouriteMovieBloc;

  @override
  void initState() {
    super.initState();
    _favouriteMovieBloc = getItInstance<FavouriteMovieBloc>();
    _favouriteMovieBloc.add(LoadFavouriteMovieEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _favouriteMovieBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite Movies",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: BlocProvider.value(
        value: _favouriteMovieBloc,
        child: BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
          builder: (context, state) {
            if (state is FavouriteMovieLoaded) {
              if (state.movieList.isEmpty) {
                return Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No Favourite Movie Added",
                      style: Theme.of(context).textTheme.subtitle1,
                    ));
              } else {
                return FavouriteMovieGridView(
                  movieList: state.movieList,
                );
              }
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
