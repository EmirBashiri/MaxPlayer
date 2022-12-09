part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeStart extends HomeEvent {}

class PlayFromURL extends HomeEvent {
  final String urlLink;

  PlayFromURL(this.urlLink);
}

class PlayFromGallery extends HomeEvent {}

