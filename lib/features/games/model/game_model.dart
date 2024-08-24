import 'package:hive/hive.dart';

part 'game_model.g.dart';

@HiveType(typeId: 2, adapterName: 'GameAdapter')
class Game {
  @HiveField(0)
  final String gameId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String picture;

  @HiveField(3)
  final String platform;

  @HiveField(4)
  final String releaseDate;

  @HiveField(5)
  final String description;

  Game({
    required this.gameId,
    required this.title,
    required this.picture,
    required this.platform,
    required this.releaseDate,
    required this.description,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['gameId'] as String,
      title: json['title'] as String,
      picture: json['picture'] as String,
      platform: json['platform'] as String,
      releaseDate: json['releaseDate'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'title': title,
      'picture': picture,
      'platform': platform,
      'releaseDate': releaseDate,
      'description': description,
    };
  }
}
