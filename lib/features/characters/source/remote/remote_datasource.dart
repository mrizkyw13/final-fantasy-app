import 'dart:convert';
import 'dart:developer';

import '../../model/character_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  static Future<List<Character>> getCharacters() async {
    var client = http.Client();
    var response = await client
        .get(Uri.parse('https://www.moogleapi.com/api/v1/characters'));

    List<Character> characters = [];

    List result = jsonDecode(response.body);

    log(result.length.toString());
    for (int i = 0; i < result.length; i++) {
      Character character =
          Character.fromJson(result[i] as Map<String, dynamic>);
      characters.add(character);
    }

    return characters;
  }
}
