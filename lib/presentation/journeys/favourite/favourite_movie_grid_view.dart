import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';

import 'favourite_movie_item.dart';

class FavouriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movieList;

  FavouriteMovieGridView({@required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.dimen_8),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movieList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Sizes.dimen_16,
          mainAxisSpacing: Sizes.dimen_16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return FavouriteMovieItem(
            movieEntity: movieList[index],
          );
        },
      ),
    );
  }
}
