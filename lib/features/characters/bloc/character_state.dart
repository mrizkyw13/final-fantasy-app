part of 'character_bloc.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterEmptyState extends CharacterState {}

final class CharacterLoadingState extends CharacterState {}

final class CharacterSuccessFetchState extends CharacterState {
  final List<Character> character;

  CharacterSuccessFetchState({required this.character});
}

final class CharacterFailFetchState extends CharacterState {
  final String message;

  CharacterFailFetchState({required this.message});
}
