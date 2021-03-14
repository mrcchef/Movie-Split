import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/presentation/app_localizations.dart';
import 'package:flutter_movie/presentation/journeys/home/home_screen.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
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
      supportedLocales: Languages.language.map((e) => Locale(e.code)).toList(),
      locale: Locale(Languages.language[0].code),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: HomeScreen(),
    );
  }
}
