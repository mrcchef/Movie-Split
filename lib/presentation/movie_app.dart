import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie/common/constants/languages.dart';
import 'package:flutter_movie/common/constants/route_constants.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/presentation/app_localizations.dart';
import 'package:flutter_movie/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_movie/presentation/blocs/language/language_bloc.dart';
import 'package:flutter_movie/presentation/journeys/home/home_screen.dart';
import 'package:flutter_movie/presentation/routes.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';
import 'package:flutter_movie/presentation/widgets/fade_page_route_builder.dart';
import 'package:flutter_movie/presentation/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LanguageBloc _languageBloc;
  AuthenticationBloc _authenticationBloc;
  final navigatorKey = GlobalKey<NavigatorState>();

  void initState() {
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredLanguageEvent());
    _authenticationBloc = getItInstance<AuthenticationBloc>();
    super.initState();
  }

  void dispose() {
    _languageBloc?.close();
    _authenticationBloc?.close();
    super.dispose();
  }

  // Navigator keys are used to navigate without using context in your app
  // For that we need to intialize a Global navigator key as shown above.
  // Then pass it to navigatorKey parameter in the mapterial app
  // Eg:-  navigatorKey.currentState.pushNamed("MyRoute");
  // use above to navigate at any part without context

  // Now wiredash needs to open the portal and for that it needs to navigate
  // and require navigation key

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(value: _languageBloc),
        BlocProvider<AuthenticationBloc>.value(value: _authenticationBloc),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        bloc: _languageBloc,
        builder: (ctx, state) {
          if (state is LanguageChanged) {
            return WiredashApp(
              navigatorKey: navigatorKey,
              locale: state.locale,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
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
                builder: (context, child) {
                  // it will return the dynamic child widget of materialApp()
                  // form the onGenerate Route
                  return child;
                },
                initialRoute: RouteConstants.initialRoute,
                onGenerateRoute: (RouteSettings settings) {
                  final route = Routes.getRoute(settings);
                  final WidgetBuilder widgetBuilder = route[settings.name];
                  return FadePageRouteBuilder(
                      routeSettings: settings, widgetBuilder: widgetBuilder);
                },
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}