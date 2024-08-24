part of 'games_bloc.dart';

@immutable
sealed class GamesState {}

final class GamesInitial extends GamesState {}

final class GamesEmptyState extends GamesState {}

final class GamesLoadingState extends GamesState {}

final class GamesSuccessFetchState extends GamesState {
  final List<Game> game;

  GamesSuccessFetchState({required this.game});
}

final class GamesFailFetchState extends GamesState {
  final String message;

  GamesFailFetchState({required this.message});
}
