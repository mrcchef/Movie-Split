import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/common/scrren_utils/screen_util.dart';
import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/domain/entities/movie_entity.dart';
import 'package:flutter_movie/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';

class MovieBackdropWidget extends StatelessWidget {
  // final MovieEntity movie;
  // MovieBackdropWidget();
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.8,
      child: ClipRRect(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(Sizes.dimen_40.w)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackdropCubit, MovieEntity>(
                bloc: BlocProvider.of(context),
                builder: (context, movieEntity) {
                  if (movieEntity != null) {
                    return CachedNetworkImage(
                      imageUrl:
                          '${APIConstants.BASE_IMAGE_URL}${movieEntity.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                height: 1,
                width: ScreenUtil.screenWidth,
                color: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
