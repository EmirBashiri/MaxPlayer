part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDefaultScreen extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final AppException appException;

  HomeError(this.appException);
}

class PlaySuccess extends HomeState {
  final VideoPlayerController playerController;

  PlaySuccess(this.playerController);
}
