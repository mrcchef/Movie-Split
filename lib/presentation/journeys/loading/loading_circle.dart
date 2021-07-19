import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  final double size;

  LoadingCircle({@required this.size});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: FlareActor(
        "assets/animations/loading_circle.flr",
        animation: "load",
        snapToEnd: true,
      ),
      // child: RiveAnimation.asset(
      //   "assets/animations/viking_cartoon.riv",
      // ),
    );
  }
}
