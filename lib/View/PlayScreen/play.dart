import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Color/color.dart';

import 'package:flutter_application_videoplayer/Model/Widgets/widget.dart';
import 'package:flutter_application_videoplayer/View/PlayScreen/bloc/play_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key, required this.playerController, required this.isYouTube});
  final bool isYouTube;
  final VideoPlayerController playerController;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

PlayBloc? playBloc;

class _PlayScreenState extends State<PlayScreen> {
  @override
  void dispose() {
    widget.playerController.dispose();

    playBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = PlayBloc();
        bloc.add(PlayStart(widget.playerController));
        playBloc = bloc;
        return bloc;
      },
      child: BlocBuilder<PlayBloc, PlayState>(
        builder: (context, state) {
          if (state is PlayVideo) {
            final pc = state.playerController;
            CustomVideoPlayerController playerController =
                CustomVideoPlayerController(
                    videoPlayerController: pc,
                    context: context,
                    customVideoPlayerSettings: CustomVideoPlayerSettings(
                        exitFullscreenOnEnd: true,
                       
                        settingsButton: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: LightThemeColor.secondry,
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: const Icon(
                            CupertinoIcons.settings,
                            color: LightThemeColor.white,
                          ),
                        ),
                        controlBarDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            color: LightThemeColor.secondry),
                        customVideoPlayerProgressBarSettings:
                            const CustomVideoPlayerProgressBarSettings(
                                progressColor: LightThemeColor.primary)));
            return Scaffold(
                backgroundColor: LightThemeColor.black,
                body: SafeArea(
                    child: Center(
                  child: CustomVideoPlayer(
                    customVideoPlayerController: playerController,
                  ),
                )));
          } else if (state is PlayLoading) {
            return loadingAnimation();
          } else if (state is PlayError) {
            return AppException(
              callback: () {
                playBloc!.add(PlayStart(widget.playerController));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
