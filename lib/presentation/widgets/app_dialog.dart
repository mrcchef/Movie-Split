import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/common/extension/string_extension.dart';
import 'package:flutter_movie/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final Widget? image;
  final String buttonText;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(description.t(context));
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(Sizes.dimen_10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: Sizes.dimen_8.w,
            ),
            Text(
              description.t(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: Sizes.dimen_8.w,
            ),
            if (image != null) image,
            Button(
              buttonText: buttonText.t(context),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
