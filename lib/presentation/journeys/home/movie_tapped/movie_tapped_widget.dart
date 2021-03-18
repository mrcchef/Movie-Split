import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/movie_tapped/movie_tapped_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/movie_listview_builder.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/movie_tapped_constants.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/tab_title_widget.dart';

class MovieTappedWidget extends StatefulWidget {
  @override
  _MovieTappedWidgetState createState() => _MovieTappedWidgetState();
}

class _MovieTappedWidgetState extends State<MovieTappedWidget> {
  MovieTappedBloc get movieTappedBloc =>
      BlocProvider.of<MovieTappedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    movieTappedBloc.add(TabChangedEvent(tabIndex: currentTabIndex));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTap(int tabIndex) {
    currentTabIndex = tabIndex;
    movieTappedBloc.add(TabChangedEvent(tabIndex: tabIndex));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTappedBloc, MovieTappedState>(
        bloc: BlocProvider.of(context),
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: Sizes.dimen_4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0;
                        i < MovieTappedConstants.movieTabs.length;
                        i++)
                      TabTitleWidget(
                        title: MovieTappedConstants.movieTabs[i].title,
                        onTap: () {
                          return onTap(
                              MovieTappedConstants.movieTabs[i].tabIndex);
                        },
                        isSelected:
                            MovieTappedConstants.movieTabs[i].tabIndex ==
                                currentTabIndex,
                      )
                  ],
                ),
                if (state is MovieTappedLoaded)
                  Expanded(child: MovieListViewBuilder(movies: state.movies))
              ],
            ),
          );
        });
  }
}
