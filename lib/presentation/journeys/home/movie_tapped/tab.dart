import 'package:flutter/material.dart';

class Tab {
  final int tabIndex;
  final String title;

  const Tab({required this.tabIndex, required this.title})
      : assert(tabIndex >= 0, 'tab index should be greater than or eqaul to 0'),
        assert(title != null, 'title should not be null');
}
