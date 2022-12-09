part of 'play_from_yt_bloc.dart';

@immutable
abstract class PlayFromYtEvent {}

class PlayFromYouTube extends PlayFromYtEvent {
  final String urlLink;

  PlayFromYouTube(this.urlLink);
}
