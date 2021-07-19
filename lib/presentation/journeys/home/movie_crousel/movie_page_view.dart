import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/animated_movie_card_widget.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int intialIndex;
  MoviePageView({
    Key key,
    @required this.movies,
    @required this.intialIndex,
  })  : assert(intialIndex >= 0, 'Initial index cannot be less than zero'),
        super(key: key);
  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.intialIndex,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_8.w, horizontal: 0.0),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (ctx, index) {
          return AnimatedMovieCardWidget(
            pageController: _pageController,
            index: index,
            movieId: widget.movies[index].id,
            posterPath: widget.movies[index].posterPath,
          );
        },
        itemCount: widget.movies?.length ?? 0,
        pageSnapping: true,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropCubit>(context)
              .movieBackdropChangeEvent(widget.movies[index]);
          // .add(MovieBackdropChangeEvent(movie: widget.movies[index]));
        },
      ),
    );
  }
}
