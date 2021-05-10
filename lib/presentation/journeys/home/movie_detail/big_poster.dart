import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/num_extension.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_app_bar.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';
import 'package:flutter_movie/domain/entities/movie_detail_entity.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const BigPoster({Key key, @required this.movieDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: Sizes.dimen_500,
        width: ScreenUtil.screenWidth,
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.2),
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: CachedNetworkImage(
          imageUrl:
              "${APIConstants.BASE_IMAGE_URL}/${movieDetailEntity.posterPath}",
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: ListTile(
          title: Text(
            movieDetailEntity.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            movieDetailEntity.releaseDate,
            style: Theme.of(context).textTheme.greySubtitle1,
          ),
          trailing: Text(
            movieDetailEntity.voteAverage.convertToPrecentageString(),
            style: Theme.of(context).textTheme.violetHeadline6,
          ),
        ),
      ),
      Positioned(
<<<<<<< HEAD
          left: Sizes.dimen_20.w,
          right: Sizes.dimen_20.w,
          top: Sizes.dimen_10 + ScreenUtil.statusBarHeight,
          child: MovieDetailAppBar(movieDetailEntity: movieDetailEntity)),
=======
        left: Sizes.dimen_20.w,
        right: Sizes.dimen_20.w,
        top: Sizes.dimen_10 + ScreenUtil.statusBarHeight,
        child: MovieDetailAppBar(
          movieDetailEntity: movieDetailEntity,
        ),
      ),
>>>>>>> e8c7ec1ca93c26cf50311cd7932685b51f4a5a08
    ]);
  }
}
