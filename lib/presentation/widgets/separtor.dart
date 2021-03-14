import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';

class Seperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: Sizes.dimen_2,
        width: Sizes.dimen_80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColor.violet, AppColor.royalBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
