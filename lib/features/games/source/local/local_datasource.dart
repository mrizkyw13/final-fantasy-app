import 'package:final_fantasy_app/features/games/model/game_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GamesLocalDataSource {
  static const String _boxKey = 'Game';

  static Future<bool> hasData() async {
    final characterBox = Hive.box(_boxKey);

    return characterBox.length > 0;
  }

  static Future<void> saveGames(List<Game> games) async {
    final characterBox = Hive.box(_boxKey);

    for (int i = 0; i < games.length; i++) {
      await characterBox.add(games[i]);
    }
  }

  static Future<List<Game>> getGames() async {
    final characterBox = Hive.box(_boxKey);

    List<Game> characters = [];
    for (int i = 0; i < characterBox.length; i++) {
      var item = characterBox.getAt(i);

      if (item is Game) {
        characters.add(item);
      }
    }
    return characters;
  }

  static Future<List<Game>> getGamesByTitle(String query) async {
    final characterBox = Hive.box(_boxKey);

    List<Game> games = characterBox.values
        .whereType<Game>()
        .where((game) => game.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return games;
  }
}
