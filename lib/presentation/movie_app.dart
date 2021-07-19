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
import 'package:flutter_movie/presentation/blocs/loading/loading_cubit.dart';
import 'package:flutter_movie/presentation/journeys/loading/loading_screen.dart';
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
  LanguageCubit _languageBloc;
  AuthenticationBloc _authenticationBloc;
  LoadingCubit _loadingCubit;
  final navigatorKey = GlobalKey<NavigatorState>();

  void initState() {
    _languageBloc = getItInstance<LanguageCubit>();
    _languageBloc.loadPreferredLanguageEvent();
    _loadingCubit = getItInstance<LoadingCubit>();
    _authenticationBloc = getItInstance<AuthenticationBloc>();
    super.initState();
  }

  void dispose() {
    _languageBloc?.close();
    _authenticationBloc?.close();
    _loadingCubit?.close();
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
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    // print(width);
    // print(height);
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>.value(value: _languageBloc),
        BlocProvider<AuthenticationBloc>.value(value: _authenticationBloc),
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
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
                  return LoadingScreen(
                    screen: child,
                    loadingCubit: _loadingCubit,
                  );
                  // return child;
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
