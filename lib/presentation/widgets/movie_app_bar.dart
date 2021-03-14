import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/presentation/journeys/home/drawer/navigation_drawer.dart';
import 'package:flutter_movie/presentation/widgets/movie_logo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.dimen_4.h + ScreenUtil.statusBarHeightPx,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: Sizes.dimen_12.h,
          ),
          Expanded(
            child: MovieLogo(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            iconSize: Sizes.dimen_12.h,
          ),
        ],
      ),
    );
  }
}
