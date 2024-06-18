// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad/features/data/models/character_model.dart';
import 'package:breaking_bad/features/data/web_services/characters_web_services.dart';

class CharactersRepo {
  CharactersWebServices charactersWebServices;

  CharactersRepo({
    required this.charactersWebServices,
  });
  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => CharacterModel.fromJson(character))
        .toList();
  }
}
