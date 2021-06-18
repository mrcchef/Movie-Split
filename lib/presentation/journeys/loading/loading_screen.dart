import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/dipendencies/get_it.dart';
import 'package:flutter_movie/presentation/blocs/loading/loading_bloc.dart';
import 'package:flutter_movie/presentation/journeys/loading/loading_circle.dart';
import 'package:flutter_movie/presentation/themes/app_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;
  final LoadingBloc loadingBloc;

  LoadingScreen({Key key, @required this.screen, @required this.loadingBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
        bloc: loadingBloc,
        builder: (context, state) {
          print("Loading Screen: $state");
          return Scaffold(
            body: Stack(fit: StackFit.expand, children: [
              screen,
              if (state is LoadingStartState)
                Container(
                  decoration:
                      BoxDecoration(color: AppColor.vulcan.withOpacity(0.8)),
                  child: Center(
                    child: LoadingCircle(size: Sizes.dimen_230.w),
                  ),
                ),
            ]),
          );
        });
  }
}
