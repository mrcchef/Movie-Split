import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/route_constants.dart';
import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_args.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_screen.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteConstants.detailScreenRoute,
          arguments: MovieDetailArgs(movieId: movie.id),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.dimen_4,
          horizontal: Sizes.dimen_8,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_8),
              child: CachedNetworkImage(
                imageUrl: "${APIConstants.BASE_IMAGE_URL}/${movie.posterPath}",
                width: Sizes.dimen_100.w,
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: Sizes.dimen_10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.greySubtitle2,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
