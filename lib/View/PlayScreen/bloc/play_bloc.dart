import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Widgets/widget.dart';
import 'package:flutter_application_videoplayer/ViewModel/Play/play.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'play_event.dart';
part 'play_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  PlayBloc() : super(PlayInitial()) {
    on<PlayEvent>((event, emit) async {
      try {
        if (event is PlayStart) {
          emit(PlayLoading());
          final playContoller = await PlayFunctions.initialVideo(
              playerController: event.playerController);
          final isPlaying = await PlayFunctions.isPlaying(playContoller);
          emit(
              PlayVideo(playerController: playContoller, isPlaying: isPlaying));
        }
      } catch (e) {
        emit(PlayError(const AppException()));
      }
    });
  }
}
