import 'package:flutter/material.dart';
import 'package:flutter_movie/presentation/app_localizations.dart';
import 'package:flutter_movie/common/extension/string_extension.dart';

class NavigationBarTile extends StatelessWidget {
  final String title;
  final Function onPressed;
  NavigationBarTile({
    @required this.title,
    @required this.onPressed,
  })  : assert(title != null, 'Title should not be null'),
        assert(onPressed != null, 'OnPressed function should not be null');
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
