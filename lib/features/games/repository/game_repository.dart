import 'package:final_fantasy_app/features/games/source/local/local_datasource.dart';
import 'package:final_fantasy_app/features/games/source/remote/remote_datasource.dart';
import '../model/game_model.dart';

class GameRepository {
  static Future<List<Game>> getGames() async {
    final hasCachedData = await GamesLocalDataSource.hasData();

    if (!hasCachedData) {
      final games = await GamesRemoteDataSource.getGames();
      await GamesLocalDataSource.saveGames(games);
    }

    final gameEntities = await GamesLocalDataSource.getGames();

    return gameEntities;
  }

  static Future<List<Game>> searchGameByTitle(String query) async {
    List<Game> games = await GamesLocalDataSource.getGamesByTitle(query);

    return games;
  }
}
