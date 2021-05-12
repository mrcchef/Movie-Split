import 'package:flutter/material.dart';
import 'package:flutter_movie/presentation/journeys/drawer/navigation_bar_expand_children_tile.dart';

class NavigationBarExpandTile extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<String> subList;
  NavigationBarExpandTile({
    @required this.title,
    @required this.subList,
    @required this.onPressed,
  })  : assert(title != null, 'Title should not be null'),
        assert(subList != null, 'sublist should not be null');
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      children: [
        for (int i = 0; i < subList.length; i++)
          NavigationBarExpandChildrenTile(
              title: subList[i], onPressed: () => onPressed(i)),
      ],
    );
  }
}
