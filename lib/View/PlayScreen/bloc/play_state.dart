part of 'play_bloc.dart';

@immutable
abstract class PlayState {}

class PlayInitial extends PlayState {}

class PlayLoading extends PlayState {}

class PlayError extends PlayState {
  final AppException appException;

  PlayError(this.appException);
}

class PlayVideo extends PlayState {
  final VideoPlayerController playerController;
  final bool isPlaying;
  PlayVideo({required this.playerController, required this.isPlaying});
}
