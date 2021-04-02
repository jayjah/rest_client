// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedbacks_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedbackObjectAdapter extends TypeAdapter<FeedbackObject> {
  @override
  final int typeId = 4;

  @override
  FeedbackObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedbackObject(
      id: fields[0] as int,
      name: fields[1] as String,
      createdAt: fields[3] as DateTime,
    )..message = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, FeedbackObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedbackObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackObject _$FeedbackObjectFromJson(Map<String, dynamic> json) {
  return FeedbackObject(
    id: json['id'] as int,
    name: json['name'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  )..message = json['message'] as String;
}

Map<String, dynamic> _$FeedbackObjectToJson(FeedbackObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'message': instance.message,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FeedbackRestClient implements FeedbackRestClient {
  _FeedbackRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<FeedbackObject>> getAll(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/feedbacks',
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
        .map((dynamic i) => FeedbackObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<FeedbackObject> getOne(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/feedbacks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FeedbackObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<FeedbackObject> update(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/feedbacks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FeedbackObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> delete(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/feedbacks/$id',
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
  Future<FeedbackObject> post(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/feedbacks',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FeedbackObject.fromJson(_result.data);
    return value;
  }
}