import 'package:final_fantasy_app/features/games/model/game_model.dart';
import 'package:final_fantasy_app/features/games/ui/game_page.dart';
import 'package:final_fantasy_app/features/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/characters/model/character_model.dart';
import 'features/characters/model/picture_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(PictureAdapter());
  Hive.registerAdapter(GameAdapter());

  await Hive.openBox('Character');
  await Hive.openBox('Game');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Fantasy App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
