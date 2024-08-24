part of 'games_bloc.dart';

@immutable
sealed class GamesEvent {}

class GamesInitialEvent extends GamesEvent {}

class GamesReloadEvent extends GamesEvent {}

class GamesSearchEvent extends GamesEvent {
  final String query;

  GamesSearchEvent({required this.query});
}
