import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_fantasy_app/features/characters/model/character_model.dart';
import 'package:final_fantasy_app/features/characters/repository/character_repository.dart';
import 'package:meta/meta.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterInitialEvent>(characterInitialEvent);
    on<CharacterReloadEvent>(characterReloadEvent);
    on<CharacterSearchEvent>(characterSearchEvent);
  }

  FutureOr<void> characterInitialEvent(
      CharacterInitialEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoadingState());

    try {
      List<Character> characters = await CharacterRepository.getCharacters();

      if (characters.isEmpty) {
        emit(CharacterEmptyState());
        return null;
      }

      emit(CharacterSuccessFetchState(character: characters));
    } catch (e) {
      emit(CharacterFailFetchState(message: e.toString()));
      log(e.toString());
    }
  }

  FutureOr<void> characterReloadEvent(
      CharacterReloadEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoadingState());

    try {
      List<Character> characters = await CharacterRepository.getCharacters();

      emit(CharacterSuccessFetchState(character: characters));
    } catch (e) {
      emit(CharacterFailFetchState(message: e.toString()));
      log(e.toString());
    }
  }

  FutureOr<void> characterSearchEvent(
      CharacterSearchEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoadingState());

    try {
      List<Character> characters =
          await CharacterRepository.searchCharacterByName(event.query);
      if (characters.isEmpty) {
        emit(CharacterEmptyState());
        return null;
      }
      emit(CharacterSuccessFetchState(character: characters));
    } catch (e) {
      emit(CharacterFailFetchState(message: e.toString()));
      log(e.toString());
    }
  }
}
