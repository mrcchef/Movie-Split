import 'package:flutter/material.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';

class ThemeText {
  // constant constructors are created for increasing performance of the app
  // classes with constat constructors does not rebuild
  // private constuctors does to intantiate
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle? get _whiteHeadline6 =>
      _poppinsTextTheme.headline6?.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );
  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5?.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: Colors.white,
      );

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1
      ?.copyWith(fontSize: Sizes.dimen_16, color: Colors.white);

  static TextStyle get whiteSubtitle2 => _poppinsTextTheme.subtitle2
      ?.copyWith(fontSize: Sizes.dimen_14, color: Colors.white);

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2
      ?.copyWith(fontSize: Sizes.dimen_14, color: Colors.white);

  static TextStyle get whiteBodyText1 => _poppinsTextTheme.bodyText1
      ?.copyWith(fontSize: Sizes.dimen_16, color: Colors.white);

  static TextStyle get whiteButton => _poppinsTextTheme.button
      ?.copyWith(fontSize: Sizes.dimen_14, color: Colors.white);

  static TextStyle get royalBlueCaption => _poppinsTextTheme.caption
      ?.copyWith(fontSize: Sizes.dimen_12, color: AppColor.royalBlue);

  static getTextTheme() => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        subtitle2: whiteSubtitle2,
        subtitle1: whiteSubtitle1,
        bodyText1: whiteBodyText1,
        bodyText2: whiteBodyText2,
        button: whiteButton,
        caption: royalBlueCaption,
      );
}

// With the help of extension we can manage the uniformatiy
extension TextThemeExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1?.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.bold,
      );

  TextStyle get greySubtitle1 => subtitle1?.copyWith(
        color: Colors.grey,
      );

  TextStyle get greySubtitle2 => subtitle2?.copyWith(
        color: Colors.grey,
      );

  TextStyle get violetHeadline6 => headline6?.copyWith(
        color: AppColor.violet,
      );
  TextStyle get vulconBoldBodyText2 => bodyText2?.copyWith(
        color: AppColor.vulcan,
        fontWeight: FontWeight.bold,
      );

  TextStyle get orangeSubtitle2 => subtitle2?.copyWith(color: Colors.orange);
}
