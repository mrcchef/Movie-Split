import 'package:flutter/material.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/constants/translate_constants.dart';
import 'package:flutter_movie/domain/entities/app_error.dart';
import 'package:flutter_movie/common/extension/string_extension.dart';
import 'package:flutter_movie/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  final Function onPressed;

  const AppErrorWidget(
      {Key? key, required this.appErrorType, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appErrorType == AppErrorType.network
                ? TranslateConstants.checkNetwork.t(context)
                : TranslateConstants.somethingWentWrong.t(context),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: Sizes.dimen_4, horizontal: Sizes.dimen_4),
                  child: Button(
                      buttonText: TranslateConstants.retry.t(context),
                      onPressed: onPressed)),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Sizes.dimen_4, horizontal: Sizes.dimen_8),
                child: Button(
                  buttonText: TranslateConstants.feedback.t(context),
                  onPressed: () {
                    return Wiredash.of(context).show();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
