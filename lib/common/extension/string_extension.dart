import 'package:flutter/cupertino.dart';
import 'package:flutter_movie/presentation/app_localizations.dart';

extension StringExtension on String {
  String t(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
