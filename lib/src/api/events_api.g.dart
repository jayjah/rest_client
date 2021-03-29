// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventObjectAdapter extends TypeAdapter<EventObject> {
  @override
  final int typeId = 3;

  @override
  EventObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventObject(
      id: fields[0] as int,
      name: fields[5] as String,
      shortDescription: fields[6] as String,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
      image: fields[9] as ImageObject,
      youtubeUrl: fields[1] as String,
      title: fields[2] as String,
      wordPressId: fields[3] as String,
      homepageLink: fields[10] as String,
      startDate: fields[11] as DateTime,
      endDate: fields[12] as DateTime,
      text: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EventObject obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.youtubeUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.wordPressId)
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
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.homepageLink)
      ..writeByte(11)
      ..write(obj.startDate)
      ..writeByte(12)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventObject _$EventObjectFromJson(Map<String, dynamic> json) {
  return EventObject(
    id: json['id'] as int,
    name: json['name'] as String,
    shortDescription: json['shortDescription'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    image: json['image'] == null
        ? null
        : ImageObject.fromJson(json['image'] as Map<String, dynamic>),
    youtubeUrl: json['youtubeUrl'] as String,
    title: json['title'] as String,
    wordPressId: json['wordPressId'] as String,
    homepageLink: json['homepageLink'] as String,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$EventObjectToJson(EventObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'youtubeUrl': instance.youtubeUrl,
      'title': instance.title,
      'wordPressId': instance.wordPressId,
      'text': instance.text,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
      'homepageLink': instance.homepageLink,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EventRestClient implements EventRestClient {
  _EventRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<EventObject>> getAll(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/events',
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
        .map((dynamic i) => EventObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<EventObject> getOne(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/events/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EventObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<EventObject> update(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/events/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EventObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> delete(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/events/$id',
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
  Future<EventObject> post(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/events',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EventObject.fromJson(_result.data);
    return value;
  }
}
