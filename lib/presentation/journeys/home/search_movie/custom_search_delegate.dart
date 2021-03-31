import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/search_movie/search_movie_card.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/presentation/widgets/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesBloc searchMoviesBloc;

  CustomSearchDelegate(this.searchMoviesBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(Sizes.dimen_4),
        child: GestureDetector(
          onTap: () {
            if (query.isNotEmpty) query = '';
          },
          child: Icon(
            Icons.clear,
            color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
            size: Sizes.dimen_20.h,
          ),
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () => close(context, null),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_20.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // if (query.isNotEmpty)
    searchMoviesBloc.add(LoadSearchMovie(searchTerm: query));

    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      bloc: searchMoviesBloc,
      builder: (context, state) {
        if (state is SearchMoviesLoaded) {
          final List<MovieEntity> movies = state.movies;

          return movies.length == 0
              ? Center(
                  child: Text(
                    "Zero Movies Found!!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              : ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return SearchMovieCard(
                      movie: movies[index],
                    );
                  },
                );
        } else if (state is SearchMoviesError) {
          final AppErrorType appErrorType = state.appErrorType;
          return AppErrorWidget(
              appErrorType: appErrorType,
              onPressed: () {
                searchMoviesBloc.add(LoadSearchMovie(searchTerm: query));
              });
        }
        return SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
