// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogsAdapter extends TypeAdapter<Blogs> {
  @override
  final int typeId = 0;

  @override
  Blogs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Blogs(
      id: fields[0] as String,
      title: fields[1] as String,
      url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Blogs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
