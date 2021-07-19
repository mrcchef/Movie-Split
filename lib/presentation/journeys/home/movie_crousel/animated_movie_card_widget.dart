import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_crousel/movie_card_widget.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';

class AnimatedMovieCardWidget extends StatefulWidget {
  final PageController pageController;
  final int index;
  final int movieId;
  final String posterPath;

  AnimatedMovieCardWidget({
    required this.pageController,
    required this.index,
    required this.movieId,
    required this.posterPath,
  });
  @override
  _AnimatedMovieCardWidgetState createState() =>
      _AnimatedMovieCardWidgetState();
}

class _AnimatedMovieCardWidgetState extends State<AnimatedMovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.pageController,
      builder: (context, child) {
        double value = 1;
        if (widget.pageController.position.haveDimensions) {
          value = (widget.pageController.page ?? 0) - widget.index;
          value = 1 - (value.abs() * 0.1).clamp(0, 1);
        } else {
          value = widget.index == 0 ? value : value * 0.9;
        }
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height:
                Curves.easeIn.transform(value) * ScreenUtil.screenHeight * 0.35,
            width: Sizes.dimen_230.w,
            child: child,
          ),
        );
      },
      child: MovieCardWidget(
        movieId: widget.movieId,
        posterPath: widget.posterPath,
      ),
    );
  }
}
