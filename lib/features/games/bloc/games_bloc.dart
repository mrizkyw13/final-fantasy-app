import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_fantasy_app/features/games/model/game_model.dart';
import 'package:final_fantasy_app/features/games/repository/game_repository.dart';
import 'package:meta/meta.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc() : super(GamesInitial()) {
    on<GamesInitialEvent>(gamesInitialEvent);
    on<GamesReloadEvent>(gamesReloadEvent);
    on<GamesSearchEvent>(gamesSearchEvent);
  }

  FutureOr<void> gamesInitialEvent(
      GamesInitialEvent event, Emitter<GamesState> emit) async {
    emit(GamesLoadingState());
    try {
      List<Game> games = await GameRepository.getGames();

      if (games.isEmpty) {
        emit(GamesEmptyState());
        return null;
      }

      emit(GamesSuccessFetchState(game: games));
    } catch (e) {
      emit(GamesFailFetchState(message: e.toString()));
      log(e.toString());
    }
  }

  FutureOr<void> gamesReloadEvent(
      GamesReloadEvent event, Emitter<GamesState> emit) async {
    emit(GamesLoadingState());
    try {
      List<Game> games = await GameRepository.getGames();

      if (games.isEmpty) {
        emit(GamesEmptyState());
        return null;
      }

      emit(GamesSuccessFetchState(game: games));
    } catch (e) {
      emit(GamesFailFetchState(message: e.toString()));
      log(e.toString());
    }
  }

  FutureOr<void> gamesSearchEvent(
      GamesSearchEvent event, Emitter<GamesState> emit) async {
    emit(GamesLoadingState());
    try {
      List<Game> games = await GameRepository.searchGameByTitle(event.query);

      if (games.isEmpty) {
        emit(GamesEmptyState());
        return null;
      }

      emit(GamesSuccessFetchState(game: games));
    } catch (e) {
      emit(GamesFailFetchState(message: e.toString()));
      log(e.toString());
    }
  }
}
