import 'package:flutter/material.dart';

class MovieLogo extends StatelessWidget {
  final double height;

  MovieLogo({
    Key? key,
    required this.height,
  })  : assert(height > 0, "Height can not be less than or equal to zero"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height,
    );
  }
}
