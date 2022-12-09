part of 'play_bloc.dart';

@immutable
abstract class PlayEvent {}

class PlayStart extends PlayEvent {
  final VideoPlayerController playerController;

  PlayStart(this.playerController);
}
