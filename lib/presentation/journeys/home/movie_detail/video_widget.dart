import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/presentation/blocs/movie_video/movie_video_bloc.dart';
import 'package:flutter_movie/presentation/widgets/button.dart';

// For playing trailer we w'll use youtube_player_plugin
// since, it is not supported in Flutter 2.0 so for now we will leave it
class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieVideoBloc, MovieVideoState>(
      builder: (ctx, state) {
        if (state is MovieVideoLoaded && state.videos.iterator.moveNext()) {
          // final _videos = state.videos;
          return Button(
            buttonText: "Watch Trailers",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) =>
                      Container())); // Need to implement watching youtube videos
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
