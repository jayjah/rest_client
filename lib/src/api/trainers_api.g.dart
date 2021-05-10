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
      id: fields[3] as int?,
      name: fields[0] as String?,
      shortDescription: fields[1] as String?,
      text: fields[2] as String?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
      user: fields[7] as UserObject?,
      image: fields[6] as ImageObject?,
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
    id: json['id'] as int?,
    name: json['name'] as String?,
    shortDescription: json['shortDescription'] as String?,
    text: json['text'] as String?,
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
      'imageId': instance.image?.id,
      'user': instance.user,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TrainerRestClient implements TrainerRestClient {
  _TrainerRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<int>> getAllIds({onlyIds = true}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<int>>(
        Options(
                method: 'GET',
                headers: <String, dynamic>{r'onlyIds': onlyIds},
                extra: _extra)
            .compose(_dio.options, '/trainers',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<Map<String, List<TrainerObject>>> getAllSplit(splitBy) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, List<TrainerObject>>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'splitBy': splitBy},
                extra: _extra)
            .compose(_dio.options, '/trainers',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!.map((k, dynamic v) => MapEntry(
        k,
        (v as List)
            .map((i) => TrainerObject.fromJson(i as Map<String, dynamic>))
            .toList()));

    return value;
  }

  @override
  Future<List<TrainerObject>> getAll({pageById, pageByDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TrainerObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate
                },
                extra: _extra)
            .compose(_dio.options, '/trainers',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => TrainerObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainerObject> getOne(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainerObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainers/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainerObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TrainerObject> update(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainerObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainers/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainerObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/trainers/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<TrainerObject> post(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainerObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainerObject.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
