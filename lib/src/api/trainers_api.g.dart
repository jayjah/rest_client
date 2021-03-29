// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainers_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainerObjectAdapter extends TypeAdapter<TrainerObject> {
  @override
  final int typeId = 17;

  @override
  TrainerObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainerObject(
      id: fields[3] as int,
      name: fields[0] as String,
      shortDescription: fields[1] as String,
      text: fields[2] as String,
      createdAt: fields[4] as DateTime,
      updatedAt: fields[5] as DateTime,
      user: fields[7] as UserObject,
      image: fields[6] as ImageObject,
    );
  }

  @override
  void write(BinaryWriter writer, TrainerObject obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.shortDescription)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainerObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerObject _$TrainerObjectFromJson(Map<String, dynamic> json) {
  return TrainerObject(
    id: json['id'] as int,
    name: json['name'] as String,
    shortDescription: json['shortDescription'] as String,
    text: json['text'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    user: json['user'] == null
        ? null
        : UserObject.fromJson(json['user'] as Map<String, dynamic>),
    image: json['image'] == null
        ? null
        : ImageObject.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TrainerObjectToJson(TrainerObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'text': instance.text,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
      'user': instance.user,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TrainerRestClient implements TrainerRestClient {
  _TrainerRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TrainerObject>> getAll(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/trainers',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'pageById': pageById,
              r'pageByDate': pageByDate,
              r'splitBy': splitBy,
              r'onlyIds': onlyIds,
              r'pageByIds': pageByIds
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TrainerObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainerObject> getOne(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/trainers/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainerObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainerObject> update(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/trainers/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainerObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> delete(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/trainers/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<TrainerObject> post(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/trainers',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainerObject.fromJson(_result.data);
    return value;
  }
}
