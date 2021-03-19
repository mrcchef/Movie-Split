import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';

import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_args.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_screen.dart';

class MovieCardWidget extends StatefulWidget {
  final int movieId;
  final String posterPath;

  MovieCardWidget({
    Key key,
    @required this.movieId,
    @required this.posterPath,
  }) : super(key: key);
  @override
  _MovieCardWidgetState createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArgs: MovieDetailArgs(movieId: widget.movieId),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: '${APIConstants.BASE_IMAGE_URL}${widget.posterPath}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
