// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PictureAdapter extends TypeAdapter<Picture> {
  @override
  final int typeId = 1;

  @override
  Picture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Picture(
      id: fields[0] as String?,
      url: fields[1] as String?,
      primary: fields[2] as int?,
      collectionId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Picture obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.primary)
      ..writeByte(3)
      ..write(obj.collectionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PictureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
