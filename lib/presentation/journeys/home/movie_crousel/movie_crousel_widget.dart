import 'package:flutter/material.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/moive_data_widget.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/movie_page_view.dart';
import 'package:flutter_movie/presentation/widgets/movie_app_bar.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/movie_backdrop_widget.dart';
import 'package:flutter_movie/presentation/widgets/separtor.dart';

class MovieCrouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  MovieCrouselWidget({
    Key? key,
    required this.movies,
    required this.defaultIndex,
  })  : assert(defaultIndex >= 0, 'Default index can not be less than 0'),
        assert(movies.isEmpty == false, 'Movies List should not be empty'),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(movies: movies, intialIndex: defaultIndex),
            MovieDataWidget(),
            Seperator(),
          ],
        ),
      ],
    );
  }
}
