import 'package:flutter_movie/common/constants/translate_constants.dart';
import 'package:flutter_movie/presentation/app_localizations.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/tab.dart';

class MovieTappedConstants {
  static const List<Tab> movieTabs = const [
    Tab(tabIndex: 0, title: TranslateConstants.popular),
    Tab(tabIndex: 1, title: TranslateConstants.now),
    Tab(tabIndex: 2, title: TranslateConstants.soon),
  ];
}
