import 'package:flutter/cupertino.dart';

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final RouteSettings routeSettings;
  final WidgetBuilder widgetBuilder;

  FadePageRouteBuilder({
    required this.routeSettings,
    required this.widgetBuilder,
  }) : super(
          pageBuilder: (context, animation, secondartAnimation) =>
              widgetBuilder(context),
          transitionsBuilder: (context, animation, secondartAnimation, child) {
            var curve = Curves.easeIn;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 500),
          // settings: settings,
        );
}
