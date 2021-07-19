import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/favourite_movie/favourite_movie_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailAppBar({required this.movieDetailEntity});

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
            size: Sizes.dimen_32.w,
          ),
        ),
        BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
          builder: (context, state) {
            if (state is IsFavouriteMovie) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<FavouriteMovieBloc>(context).add(
                    ToggleFavouriteMovieEvent(
                      movieEntity:
                          MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                      isFavourite: state.isFavouriteMovie,
                    ),
                  );
                },
                child: Icon(
                  state.isFavouriteMovie
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_32.w,
                ),
              );
            } else
              return Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_32.w,
              );
          },
          // child:
        ),
      ],
    );
  }
}
