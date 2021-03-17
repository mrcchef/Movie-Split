import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/wiredash_constant.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final locale;

  WiredashApp(
      {@required this.navigatorKey,
      @required this.child,
      @required this.locale});

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: WiredashConstants.projectId,
      secret: WiredashConstants.sdkKey,
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(locale: locale),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.violet,
        secondaryColor: AppColor.royalBlue,
        dividerColor: AppColor.vulcan,
        primaryBackgroundColor: AppColor.vulcan,
      ),
    );
  }
}
