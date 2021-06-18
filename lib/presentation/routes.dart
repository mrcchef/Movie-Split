import 'package:flutter/cupertino.dart';
import 'package:flutter_movie/common/constants/route_constants.dart';
import 'package:flutter_movie/presentation/journeys/favourite/favourite_screen.dart';
import 'package:flutter_movie/presentation/journeys/home/home_screen.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_detail/movie_detail_screen.dart';
import 'package:flutter_movie/presentation/journeys/login/login_screen.dart';

import 'journeys/loading/loading_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute(RouteSettings settings) => {
        RouteConstants.initialRoute: (context) => LoginScreen(),
        RouteConstants.homeScreen: (context) => HomeScreen(),
        RouteConstants.detailScreenRoute: (context) =>
            MovieDetailScreen(movieDetailArgs: settings.arguments),
        RouteConstants.favouriteScreen: (context) => FavouriteScreen(),
      };
}
