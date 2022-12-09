import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Widgets/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStart) {
        emit(HomeDefaultScreen());
      }
      try {
        if (event is PlayFromURL) {
          emit(HomeLoading());
          final VideoPlayerController playerController =
              VideoPlayerController.network(event.urlLink);
          emit(PlaySuccess(playerController));
          emit(HomeDefaultScreen());
        } else if (event is PlayFromGallery) {
          emit(HomeLoading());

          late File videoFile;

          final ImagePicker picker = ImagePicker();

          emit(HomeLoading());

          await picker.pickVideo(source: ImageSource.gallery).then((value) {
            if (value != null) {
              videoFile = File(value.path);
            } else {
              emit(HomeError(const AppException()));
            }
          });
          final VideoPlayerController playerController =
              VideoPlayerController.file(videoFile);

          emit(PlaySuccess(playerController));
          emit(HomeDefaultScreen());
        } 
      } catch (e) {
        emit(HomeError(const AppException()));
      }
    });
  }
}
