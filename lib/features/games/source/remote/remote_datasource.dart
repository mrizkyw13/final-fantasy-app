import 'dart:convert';

import '../../model/game_model.dart';
import 'package:http/http.dart' as http;

class GamesRemoteDataSource {
  static Future<List<Game>> getGames() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse('https://www.moogleapi.com/api/v1//games'));

    List<Game> games = [];

    List result = jsonDecode(response.body);

    for (int i = 0; i < result.length; i++) {
      Game game = Game.fromJson(result[i] as Map<String, dynamic>);

      games.add(game);
    }

    return games;
  }
}
