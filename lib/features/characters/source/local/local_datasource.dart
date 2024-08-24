import 'package:final_fantasy_app/features/characters/model/character_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static const String _boxKey = 'Character';

  static Future<bool> hasData() async {
    final characterBox = Hive.box(_boxKey);

    return characterBox.length > 0;
  }

  static Future<void> saveCharacters(List<Character> characters) async {
    final characterBox = Hive.box(_boxKey);

    for (int i = 0; i < characters.length; i++) {
      await characterBox.add(characters[i]);
    }
  }

  static Future<List<Character>> getCharacters() async {
    final characterBox = Hive.box(_boxKey);

    List<Character> characters = [];
    for (int i = 0; i < characterBox.length; i++) {
      var item = characterBox.getAt(i);

      if (item is Character) {
        characters.add(item);
      }
    }
    return characters;
  }

  static Future<List<Character>> getCharactersByName(String query) async {
    final characterBox = Hive.box(_boxKey);

    List<Character> characters = characterBox.values
        .whereType<Character>()
        .where((character) =>
            character.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return characters;
  }
}
