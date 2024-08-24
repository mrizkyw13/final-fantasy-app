part of 'character_bloc.dart';

@immutable
sealed class CharacterEvent {}

class CharacterInitialEvent extends CharacterEvent {}

class CharacterReloadEvent extends CharacterEvent {}

class CharacterSearchEvent extends CharacterEvent {
  final String query;

  CharacterSearchEvent({required this.query});
}
