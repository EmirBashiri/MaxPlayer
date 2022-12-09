import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Color/color.dart';
import 'package:flutter_application_videoplayer/Model/Widgets/widget.dart';
import 'package:flutter_application_videoplayer/View/PlayScreenFromYT/bloc/play_from_yt_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayScreenYT extends StatelessWidget {
  const PlayScreenYT({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayFromYtBloc, PlayFromYtState>(
      builder: (context, state) {
        if (state is PlayYTSuccess) {
          final controller = state.playerController;
         
          return Scaffold(
            backgroundColor: LightThemeColor.black,
            body: Center(
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: LightThemeColor.secondry,
                  bufferIndicator: loadingAnimation(),
                  progressColors: const ProgressBarColors(
                      playedColor: LightThemeColor.secondry,
                      backgroundColor: LightThemeColor.white),
                ),
                builder: (context, player) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [player],
                  );
                },
              ),
            ),
          );
        } else if (state is PlayYtLoading) {
          return loadingAnimation();
        } else if (state is PlayYtError) {
          return AppException(
            callback: () {
              Navigator.pop(context);
            },
          );
        }
        return loadingAnimation();
      },
    );
  }
}
