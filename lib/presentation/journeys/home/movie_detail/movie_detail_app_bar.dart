import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/favourite/favourite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({Key key, this.movieDetailEntity}) : super(key: key);
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
        BlocBuilder<FavouriteBloc, FavouriteState>(
          bloc: BlocProvider.of<FavouriteBloc>(context),
          builder: (context, state) {
            if (state is IsFavouriteMovie) {
              return GestureDetector(
                onTap: () {
                  print(state.isFavourite);
                  BlocProvider.of<FavouriteBloc>(context).add(
                    ToggleFavouriteMovieEvent(
                      movieEntity: MovieEntity.fromMovieDetailEntity(
                        movieDetailEntity,
                      ),
                      isFavourite: state.isFavourite,
                    ),
                  );
                },
                child: Icon(
                  state.isFavourite ? Icons.favorite : Icons.favorite_border,
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
        ),
      ],
    );
  }
}
