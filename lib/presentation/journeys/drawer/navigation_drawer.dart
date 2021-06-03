import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/common/constants/route_constants.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/constants/translate_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/common/extension/string_extension.dart';
import 'package:flutter_movie/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_movie/presentation/blocs/language/language_bloc.dart';
import 'package:flutter_movie/presentation/journeys/drawer/navigation_bar_expand_tile.dart';
import 'package:flutter_movie/presentation/journeys/drawer/navigation_bar_tile.dart';

import 'package:flutter_movie/presentation/widgets/app_dialog.dart';
import 'package:flutter_movie/presentation/widgets/movie_logo.dart';
import 'package:wiredash/wiredash.dart';

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
            onPressed: () {
              Navigator.of(context).pushNamed(RouteConstants.favouriteScreen);
            },
          ),
          NavigationBarExpandTile(
            title: TranslateConstants.language.t(context),
            onPressed: (index) {
              BlocProvider.of<LanguageBloc>(context).add(
                ToggleLanguageEvent(languageEntity: Languages.language[index]),
              );
            },
            subList: Languages.language.map((e) => e.value).toList(),
          ),
          NavigationBarTile(
            title: TranslateConstants.feedback,
            onPressed: () {
              Navigator.of(context).pop();
              Wiredash.of(context).show();
            },
          ),
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listenWhen: (previous, current) => current is LogoutSuccess,
            listener: (context, state) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteConstants.initialRoute, (route) => false);
            },
            child: NavigationBarTile(
              title: TranslateConstants.logout,
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
              },
            ),
          ),
          NavigationBarTile(
            title: TranslateConstants.about,
            onPressed: () {
              Navigator.of(context).pop();
              _showDialog(context);
            },
          ),
        ],
      )),
    );
  }

  Future _showDialog(BuildContext context) {
    // print(TranslateConstants.description);
    return showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: TranslateConstants.about,
        description: TranslateConstants.description,
        buttonText: TranslateConstants.okay,
        image: Image.asset(
          "assets/pngs/tmdb_logo.png",
          height: Sizes.dimen_80,
        ),
      ),
    );
  }
}
