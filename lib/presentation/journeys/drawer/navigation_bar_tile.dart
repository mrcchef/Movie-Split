import 'package:flutter/material.dart';
import 'package:flutter_movie/common/extension/string_extension.dart';

class NavigationBarTile extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  NavigationBarTile({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          title.t(context),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
