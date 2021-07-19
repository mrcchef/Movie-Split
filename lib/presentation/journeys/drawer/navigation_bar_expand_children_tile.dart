import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';

class NavigationBarExpandChildrenTile extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  NavigationBarExpandChildrenTile({
    required this.title,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_20),
      child: GestureDetector(
        onTap: onPressed,
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
