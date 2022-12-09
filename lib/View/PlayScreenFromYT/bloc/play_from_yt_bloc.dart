import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Widgets/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'play_from_yt_event.dart';
part 'play_from_yt_state.dart';

class PlayFromYtBloc extends Bloc<PlayFromYtEvent, PlayFromYtState> {
  PlayFromYtBloc() : super(PlayFromYtInitial()) {
    on<PlayFromYtEvent>((event, emit) async {
      try {
        if (event is PlayFromYouTube) {
          emit(PlayYtLoading());
          final String url = event.urlLink.split('/').last;
          final YoutubePlayerController playerController =
              YoutubePlayerController(
                  initialVideoId: url,
                  flags: const YoutubePlayerFlags(enableCaption: true));
          await Future.delayed(const Duration(seconds: 2));
          emit(PlayYTSuccess(playerController));
        }
      } catch (e) {
        emit(PlayYtError(const AppException()));
      }
    });
  }
}
