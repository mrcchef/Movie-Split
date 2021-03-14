import 'package:flutter/material.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';

class MovieLogo extends StatelessWidget {
  final double height;

  MovieLogo({
    Key key,
    @required this.height,
  })  : assert(height > 0, "Height can not be less than or equal to zero"),
        assert(height != null, "Height can not be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
