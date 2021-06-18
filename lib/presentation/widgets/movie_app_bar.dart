import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/search_movie/custom_search_delegate.dart';
import 'package:flutter_movie/presentation/widgets/movie_logo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.dimen_4.w + Sizes.dimen_48.w,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: Sizes.dimen_24.w,
          ),
          Expanded(
            child: MovieLogo(
              height: Sizes.dimen_32.w,
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                      BlocProvider.of<SearchMoviesBloc>(context)));
            },
            iconSize: Sizes.dimen_24.w,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
