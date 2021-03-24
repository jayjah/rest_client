// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageObjectAdapter extends TypeAdapter<ImageObject> {
  @override
  final int typeId = 0;

  @override
  ImageObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageObject(
      id: fields[0] as int,
      name: fields[1] as String,
      shortDescription: fields[2] as String,
      createdAt: fields[3] as DateTime,
      updatedAt: fields[4] as DateTime,
      youtubeUrl: fields[5] as String,
      title: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.shortDescription)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.youtubeUrl)
      ..writeByte(6)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageObject _$ImageObjectFromJson(Map<String, dynamic> json) {
  return ImageObject(
    id: json['id'] as int,
    name: json['name'] as String,
    shortDescription: json['shortDescription'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    youtubeUrl: json['youtubeUrl'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ImageObjectToJson(ImageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'youtubeUrl': instance.youtubeUrl,
      'title': instance.title,
    };
