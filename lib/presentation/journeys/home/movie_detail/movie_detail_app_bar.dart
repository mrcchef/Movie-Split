import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
<<<<<<< HEAD
import 'package:flutter_movie/presentation/blocs/favourite_movie/favourite_movie_bloc.dart';
=======
import 'package:flutter_movie/presentation/blocs/favourite/favourite_bloc.dart';
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

<<<<<<< HEAD
  MovieDetailAppBar({this.movieDetailEntity});

=======
  const MovieDetailAppBar({Key key, this.movieDetailEntity}) : super(key: key);
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: Sizes.dimen_20.h,
          ),
        ),
<<<<<<< HEAD
        BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
=======
        BlocBuilder<FavouriteBloc, FavouriteState>(
          bloc: BlocProvider.of<FavouriteBloc>(context),
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
          builder: (context, state) {
            if (state is IsFavouriteMovie) {
              return GestureDetector(
                onTap: () {
<<<<<<< HEAD
                  BlocProvider.of<FavouriteMovieBloc>(context).add(
                    ToggleFavouriteMovieEvent(
                      movieEntity:
                          MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                      isFavourite: state.isFavouriteMovie,
=======
                  print(state.isFavourite);
                  BlocProvider.of<FavouriteBloc>(context).add(
                    ToggleFavouriteMovieEvent(
                      movieEntity: MovieEntity.fromMovieDetailEntity(
                        movieDetailEntity,
                      ),
                      isFavourite: state.isFavourite,
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
                    ),
                  );
                },
                child: Icon(
<<<<<<< HEAD
                  state.isFavouriteMovie
                      ? Icons.favorite
                      : Icons.favorite_border,
=======
                  state.isFavourite ? Icons.favorite : Icons.favorite_border,
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
                  color: Colors.white,
                  size: Sizes.dimen_20.h,
                ),
              );
            } else
              return Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_20.h,
              );
          },
<<<<<<< HEAD
          // child:
=======
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
        ),
      ],
    );
  }
}
