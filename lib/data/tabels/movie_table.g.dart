// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieTableAdapter extends TypeAdapter<MovieTable> {
  @override
  final int typeId = 0;

  @override
  MovieTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieTable(
      movieId: fields[0] as int,
      title: fields[1] as String,
      backdropPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.movieId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.backdropPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
