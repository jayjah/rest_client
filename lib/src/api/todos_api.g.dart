// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoObjectAdapter extends TypeAdapter<TodoObject> {
  @override
  final int typeId = 10;

  @override
  TodoObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoObject(
      id: fields[0] as int?,
      name: fields[5] as String?,
      shortDescription: fields[6] as String?,
      createdAt: fields[7] as DateTime?,
      updatedAt: fields[8] as DateTime?,
      endDate: fields[1] as DateTime?,
      isDone: fields[3] as bool?,
      title: fields[2] as String?,
      user: fields[9] as UserObject?,
      text: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoObject obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.endDate)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.isDone)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.shortDescription)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoObject _$TodoObjectFromJson(Map<String, dynamic> json) {
  return TodoObject(
    id: json['id'] as int?,
    name: json['name'] as String?,
    shortDescription: json['shortDescription'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    isDone: json['isDone'] as bool?,
    title: json['title'] as String?,
    user: json['user'] == null
        ? null
        : UserObject.fromJson(json['user'] as Map<String, dynamic>),
    text: json['text'] as String?,
  );
}

Map<String, dynamic> _$TodoObjectToJson(TodoObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endDate': instance.endDate?.toIso8601String(),
      'title': instance.title,
      'isDone': instance.isDone,
      'text': instance.text,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'user': instance.user,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TodoRestClient implements TodoRestClient {
  _TodoRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<TodoObject>> getAll(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TodoObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate,
                  if (splitBy != null) r'splitBy': splitBy,
                  if (onlyIds != null) r'onlyIds': onlyIds,
                  if (pageByIds != null) r'pageByIds': pageByIds
                },
                extra: _extra)
            .compose(_dio.options, '/todos',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => TodoObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TodoObject> getOne(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TodoObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/todos/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TodoObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TodoObject> update(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TodoObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/todos/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TodoObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TodoObject> todoIsDone(todoId, userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TodoObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users/$userId/todos/$todoId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TodoObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/todos/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<TodoObject> post(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TodoObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/todos',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TodoObject.fromJson(_result.data!);
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
