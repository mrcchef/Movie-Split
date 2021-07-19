import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  MovieListViewBuilder({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return MovieTabCardWidget(
            title: movies[index].title,
            posterPath: movies[index].posterPath,
            movieId: movies[index].id);
      },
      itemCount: movies.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.white,
      ),
    );
  }
}
