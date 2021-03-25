import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/extension/size_extension.dart';
import 'package:flutter_movie/common/constants/size_constants.dart';
import 'package:flutter_movie/data/core/api_constraint.dart';
import 'package:flutter_movie/domain/entities/movie_cast_entity.dart';
import 'package:flutter_movie/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:flutter_movie/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastBloc, MovieCastState>(
      bloc: BlocProvider.of<MovieCastBloc>(context),
      builder: (context, state) {
        if (state is MovieCastLoaded) {
          final List<MovieCastEntity> cast = state.cast;
          print(cast.length);
          return Container(
            height: Sizes.dimen_150.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  height: Sizes.dimen_150.h,
                  width: Sizes.dimen_110.h,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.dimen_10),
                    ),
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_8, vertical: Sizes.dimen_4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizes.dimen_10),
                            topRight: Radius.circular(Sizes.dimen_10),
                          ),
                          child: CachedNetworkImage(
                            height: Sizes.dimen_110.h,
                            width: Sizes.dimen_110.h,
                            imageUrl:
                                '${APIConstants.BASE_IMAGE_URL}${cast[index].posterPath}',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Sizes.dimen_1,
                              horizontal: Sizes.dimen_8),
                          child: Text(
                            cast[index].name,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.vulconBoldBodyText2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Sizes.dimen_1,
                              horizontal: Sizes.dimen_8),
                          child: Text(
                            cast[index].character,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: cast.length,
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
