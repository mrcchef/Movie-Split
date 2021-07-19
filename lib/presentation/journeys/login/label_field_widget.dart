import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';

class LabelFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isPasswordField;
  final UnderlineInputBorder _enabledBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: Sizes.dimen_1,
    ),
  );

  final UnderlineInputBorder _focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: Sizes.dimen_1,
    ),
  );
  const LabelFieldWidget(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.isPasswordField = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.greySubtitle1,
            focusedBorder: _focusedBorder,
            enabledBorder: _enabledBorder,
          ),
          controller: controller,
          obscureText: isPasswordField,
          obscuringCharacter: '*',
        ),
      ],
    );
  }
}
