import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/route_constants.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/favourite_movie/favourite_movie_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_args.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_screen.dart';

class FavouriteMovieItem extends StatelessWidget {
  final MovieEntity movieEntity;

  FavouriteMovieItem({this.movieEntity});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_12),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteConstants.detailScreenRoute,
                  arguments: MovieDetailArgs(movieId: movieEntity.id),
                );
              },
              child: CachedNetworkImage(
                imageUrl:
                    "${APIConstants.BASE_IMAGE_URL}/${movieEntity.posterPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              right: Sizes.dimen_12,
              top: Sizes.dimen_8,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<FavouriteMovieBloc>(context)
                      .add(DeleteFavouriteMovieEvent(movieId: movieEntity.id));
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
