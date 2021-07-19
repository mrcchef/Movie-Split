import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final bool isEnabled;

  const Button(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
        gradient: LinearGradient(
          colors: isEnabled
              ? [
                  AppColor.royalBlue,
                  AppColor.violet,
                ]
              : [Colors.grey, Colors.grey],
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
