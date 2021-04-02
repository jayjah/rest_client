// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsObjectAdapter extends TypeAdapter<NewsObject> {
  @override
  final int typeId = 1;

  @override
  NewsObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsObject(
      id: fields[0] as int,
      name: fields[5] as String,
      shortDescription: fields[6] as String,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
      image: fields[9] as ImageObject,
      youtubeUrl: fields[1] as String,
      title: fields[2] as String,
      wordPressId: fields[3] as String,
      text: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsObject obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsObject _$NewsObjectFromJson(Map<String, dynamic> json) {
  return NewsObject(
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
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$NewsObjectToJson(NewsObject instance) =>
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
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsRestClient implements NewsRestClient {
  _NewsRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<NewsObject>> getAll(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/news',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            contentType: 'application/json',
            headers: <String, dynamic>{
              if (pageById != null) r'pageById': pageById,
              if (pageByDate != null) r'pageByDate': pageByDate,
              if (splitBy != null) r'splitBy': splitBy,
              if (onlyIds != null) r'onlyIds': onlyIds,
              if (pageByIds != null) r'pageByIds': pageByIds
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => NewsObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<NewsObject> getOne(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/news/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsObject> update(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/news/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> delete(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/news/$id',
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
  Future<NewsObject> post(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/news',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsObject.fromJson(_result.data);
    return value;
  }
}
