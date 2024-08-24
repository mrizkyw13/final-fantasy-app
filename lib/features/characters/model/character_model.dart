import 'package:hive_flutter/hive_flutter.dart';
import 'picture_model.dart';

part 'character_model.g.dart';

@HiveType(typeId: 0, adapterName: 'CharacterAdapter')
class Character {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? japaneseName;

  @HiveField(3)
  final String? age;

  @HiveField(4)
  final String? gender;

  @HiveField(5)
  final String? race;

  @HiveField(6)
  final String? job;

  @HiveField(7)
  final String? height;

  @HiveField(8)
  final String? weight;

  @HiveField(9)
  final String? origin;

  @HiveField(10)
  final String? description;

  @HiveField(11)
  final List<Picture>? pictures;

  @HiveField(12)
  final List<dynamic>? stats;

  Character({
    required this.id,
    required this.name,
    this.japaneseName,
    this.age,
    this.gender,
    this.race,
    this.job,
    this.height,
    this.weight,
    this.origin,
    this.description,
    this.pictures,
    this.stats,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      japaneseName: json['japaneseName'],
      age: json['age'],
      gender: json['gender'],
      race: json['race'],
      job: json['job'],
      height: json['height'],
      weight: json['weight'],
      origin: json['origin'],
      description: json['description'],
      pictures: json['pictures'] != null
          ? (json['pictures'] as List)
              .map((picture) => Picture.fromJson(picture))
              .toList()
          : null,
      stats: json['stats'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'japaneseName': japaneseName,
      'age': age,
      'gender': gender,
      'race': race,
      'job': job,
      'height': height,
      'weight': weight,
      'origin': origin,
      'description': description,
      'pictures': pictures?.map((picture) => picture.toJson()).toList(),
      'stats': stats,
    };
  }
}
