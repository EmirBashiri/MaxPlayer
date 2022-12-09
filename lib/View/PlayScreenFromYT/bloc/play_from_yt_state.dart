part of 'play_from_yt_bloc.dart';

@immutable
abstract class PlayFromYtState {}

class PlayFromYtInitial extends PlayFromYtState {}

class PlayYTSuccess extends PlayFromYtState {
  final YoutubePlayerController playerController;

  PlayYTSuccess(this.playerController);
}

class PlayYtLoading extends PlayFromYtState {}

class PlayYtError extends PlayFromYtState {
  final AppException appException;

  PlayYtError(this.appException);
}
