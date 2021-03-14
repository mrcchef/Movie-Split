import 'package:flutter/material.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';

class ThemeText {
  // constant constructors are created for increasing performance of the app
  // classes with constat constructors does not rebuild
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );
  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.headline5
      .copyWith(fontSize: Sizes.dimen_16, color: Colors.white);

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2
      .copyWith(fontSize: Sizes.dimen_14, color: Colors.white);

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        subtitle1: whiteSubtitle1,
        bodyText2: whiteBodyText2,
      );
}

// With the help of extension we can manage the uniformatiy
extension TextThemeExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.bold,
      );
}
