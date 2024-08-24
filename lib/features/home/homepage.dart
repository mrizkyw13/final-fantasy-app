import 'package:final_fantasy_app/features/characters/ui/character_page.dart';
import 'package:final_fantasy_app/features/games/ui/game_page.dart';
import 'package:final_fantasy_app/features/home/components/character_list_component.dart';
import 'package:final_fantasy_app/features/home/components/game_list_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Character'),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const CharacterPage());
                      },
                      child: const Text('View All'))
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          const SliverToBoxAdapter(child: CharacterList()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Game'),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const GamesPage());
                      },
                      child: const Text('View All'))
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          const SliverToBoxAdapter(child: GameList()),
        ],
      )),
    );
  }
}
