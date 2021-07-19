import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/presentation/blocs/loading/loading_cubit.dart';
import 'package:flutter_movie/presentation/journeys/loading/loading_circle.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget? screen;
  final LoadingCubit loadingCubit;

  LoadingScreen({Key? key, required this.screen, required this.loadingCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    // ScreenUtil.init(height: height, width: width);
    return Scaffold(
      body: BlocBuilder<LoadingCubit, bool>(
        bloc: loadingCubit,
        builder: (context, shouldShow) {
          print("Loading Screen: $shouldShow");
          return Stack(fit: StackFit.expand, children: [
            screen ?? SizedBox.shrink(),
            if (shouldShow)
              Container(
                decoration:
                    BoxDecoration(color: AppColor.vulcan.withOpacity(0.8)),
                child: Center(
                  child: LoadingCircle(size: Sizes.dimen_230.w),
                ),
              ),
          ]);
        },
      ),
    );
  }
}
