import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/common/constants/translate_constants.dart';
import 'package:flutter_movie/common/extension/string_extension.dart';
import 'package:flutter_movie/presentation/blocs/movie_tapped/movie_tapped_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/movie_listview_builder.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/movie_tapped_constants.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/tab_title_widget.dart';
import 'package:flutter_movie/presentation/journeys/loading/loading_circle.dart';
import 'package:flutter_movie/presentation/widgets/app_error_widget.dart';

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
      bloc: BlocProvider.of<MovieTappedBloc>(context),
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
                      isSelected: MovieTappedConstants.movieTabs[i].tabIndex ==
                          currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTappedLoaded)
                state.movies.length == 0
                    ? Expanded(
                        child: Center(
                          child: Text(
                            TranslateConstants.noMovies.t(context),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieListViewBuilder(movies: state.movies)),
              if (state is MovieTappedError)
                Expanded(
                  child: AppErrorWidget(
                    appErrorType: state.appErrorType,
                    onPressed: () {
                      movieTappedBloc
                          .add(TabChangedEvent(tabIndex: state.tabIndex));
                    },
                  ),
                ),
              if (state is MovieTappedLoadingState)
                Expanded(
                    child: LoadingCircle(
                  size: Sizes.dimen_100.w,
                ))
            ],
          ),
        );
      },
    );
  }
}
