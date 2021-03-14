import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/presentation/journeys/home/movie_tapped/movie_tapped_constants.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  TabTitleWidget(
      {@required this.title, @required this.onTap, this.isSelected = false})
      : assert(title != null, 'Tab title should not be null'),
        assert(onTap != null, 'OnTap should not be null');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: Sizes.dimen_1,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.subtitle1.copyWith(
                    color: AppColor.royalBlue,
                    fontWeight: FontWeight.bold,
                  )
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
