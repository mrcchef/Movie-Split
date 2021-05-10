import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/route_constants.dart';
import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_args.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_screen.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  final String title;
  MovieTabCardWidget(
      {@required this.title, @required this.posterPath, @required this.movieId})
      : assert(title != null, 'title should not be equal to null'),
        assert(posterPath != null, 'imageUrl should not be eqaul to null');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteConstants.detailScreenRoute,
          arguments: MovieDetailArgs(movieId: movieId),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: '${APIConstants.BASE_IMAGE_URL}$posterPath',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title.length > 10 ? title.substring(0, 10) + '...' : title,
              style: Theme.of(context).textTheme.subtitle1,
              maxLines: 1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
