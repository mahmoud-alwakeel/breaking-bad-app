import 'package:breaking_bad/features/data/models/character_model.dart';
import 'package:breaking_bad/features/data/repository/characters_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  late List<CharacterModel> characters;

  CharactersCubit({required this.charactersRepo}) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepo.getAllCharacters().then((character) {
      emit(CharactersLoadedState(characters: character));
      characters = character;
    });
    return characters;
  }
}
