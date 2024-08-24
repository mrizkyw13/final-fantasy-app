import 'package:hive_flutter/hive_flutter.dart';
part 'picture_model.g.dart';

@HiveType(typeId: 1, adapterName: 'PictureAdapter')
class Picture {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? url;

  @HiveField(2)
  final int? primary;

  @HiveField(3)
  final String? collectionId;

  Picture({
    this.id,
    this.url,
    this.primary,
    this.collectionId,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'],
      url: json['url'],
      primary: json['primary'],
      collectionId: json['collectionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'primary': primary,
      'collectionId': collectionId,
    };
  }
}
