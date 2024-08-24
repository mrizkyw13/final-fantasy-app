// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterAdapter extends TypeAdapter<Character> {
  @override
  final int typeId = 0;

  @override
  Character read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Character(
      id: fields[0] as String,
      name: fields[1] as String,
      japaneseName: fields[2] as String?,
      age: fields[3] as String?,
      gender: fields[4] as String?,
      race: fields[5] as String?,
      job: fields[6] as String?,
      height: fields[7] as String?,
      weight: fields[8] as String?,
      origin: fields[9] as String?,
      description: fields[10] as String?,
      pictures: (fields[11] as List?)?.cast<Picture>(),
      stats: (fields[12] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Character obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.japaneseName)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.race)
      ..writeByte(6)
      ..write(obj.job)
      ..writeByte(7)
      ..write(obj.height)
      ..writeByte(8)
      ..write(obj.weight)
      ..writeByte(9)
      ..write(obj.origin)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.pictures)
      ..writeByte(12)
      ..write(obj.stats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
