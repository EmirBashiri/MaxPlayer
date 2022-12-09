import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class PlayFunctions {
 

  static Future<bool> isPlaying(VideoPlayerController playerController) async {
    bool isPlaying = playerController.value.isPlaying;
    return isPlaying;
  }

  static Future<VideoPlayerController> initialVideo(
      {required VideoPlayerController playerController}) async {
    await playerController.initialize();
    await playerController.play();
    return playerController;
  }

  static void videoTimer({required GestureTapCallback callback}) {
    Timer(const Duration(milliseconds: 700), callback);
  }
}
