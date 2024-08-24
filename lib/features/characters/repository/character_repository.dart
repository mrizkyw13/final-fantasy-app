import 'package:final_fantasy_app/features/characters/model/character_model.dart';
import 'package:final_fantasy_app/features/characters/source/local/local_datasource.dart';
import 'package:final_fantasy_app/features/characters/source/remote/remote_datasource.dart';

class CharacterRepository {
  static Future<List<Character>> getCharacters() async {
    final hasCachedData = await LocalDataSource.hasData();

    if (!hasCachedData) {
      final characters = await RemoteDataSource.getCharacters();
      await LocalDataSource.saveCharacters(characters);
    }

    final characterEntities = await LocalDataSource.getCharacters();

    return characterEntities;
  }

  static Future<List<Character>> searchCharacterByName(String query) async {
    List<Character> characters =
        await LocalDataSource.getCharactersByName(query);

    return characters;
  }
}
