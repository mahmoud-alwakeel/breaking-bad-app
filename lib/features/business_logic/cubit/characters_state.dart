part of 'characters_cubit.dart';

sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoadedState extends CharactersState {
  final List<CharacterModel> characters;

  CharactersLoadedState({required this.characters});
}
