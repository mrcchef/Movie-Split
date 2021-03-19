import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';

class MovieDetailAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: Sizes.dimen_20.h,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: Sizes.dimen_20.h,
          ),
        ),
      ],
    );
  }
}
