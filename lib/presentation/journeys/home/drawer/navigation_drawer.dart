import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/constants/translate_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/presentation/app_localizations.dart';
import 'package:flutter_movie/common/extension/string_extension.dart';
import 'package:flutter_movie/presentation/journeys/home/drawer/navigation_bar_expand_tile.dart';
import 'package:flutter_movie/presentation/journeys/home/drawer/navigation_bar_tile.dart';
import 'package:flutter_movie/presentation/journeys/home/language/language_bloc.dart';
import 'package:flutter_movie/presentation/widgets/movie_logo.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          )
        ],
      ),
      width: Sizes.dimen_230.w,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: Sizes.dimen_40,
              left: Sizes.dimen_8,
              right: Sizes.dimen_8,
              bottom: Sizes.dimen_40,
            ),
            child: MovieLogo(
              height: Sizes.dimen_40,
            ),
          ),
          NavigationBarTile(
            title: TranslateConstants.favoriteMovies,
            onPressed: () {},
          ),
          NavigationBarExpandTile(
            title: TranslateConstants.language.t(context),
            onPressed: (index) {
              BlocProvider.of<LanguageBloc>(context).add(LanguageChangeEvent(
                  languageEntity: Languages.language[index]));
            },
            subList: Languages.language.map((e) => e.value).toList(),
          ),
          NavigationBarTile(
            title: TranslateConstants.feedback,
            onPressed: () {},
          ),
          NavigationBarTile(
            title: TranslateConstants.about,
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
