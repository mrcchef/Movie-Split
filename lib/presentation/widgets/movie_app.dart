import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/presentation/app_localizations.dart';
import 'package:flutter_movie/presentation/journeys/home/home_screen.dart';
import 'package:flutter_movie/presentation/journeys/home/language/language_bloc.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LanguageBloc languageBloc;

  void initState() {
    languageBloc = getItInstance<LanguageBloc>();
    super.initState();
  }

  void dispose() {
    languageBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>(
      create: (context) => languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        cubit: languageBloc,
        builder: (ctx, state) {
          if (state is LanguageChanged) {
            return MaterialApp(
              title: 'Movie App',
              theme: ThemeData(
                primaryColor: AppColor.vulcan,
                accentColor: AppColor.royalBlue,
                unselectedWidgetColor: AppColor.royalBlue,
                scaffoldBackgroundColor: AppColor.vulcan,
                appBarTheme: AppBarTheme(elevation: 0),
                textTheme: ThemeText.getTextTheme(),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              supportedLocales:
                  Languages.language.map((e) => Locale(e.code)).toList(),
              locale: state.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: HomeScreen(),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
