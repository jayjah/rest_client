// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsletters_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsletterObjectAdapter extends TypeAdapter<NewsletterObject> {
  @override
  final int typeId = 8;

  @override
  NewsletterObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsletterObject(
      id: fields[0] as int?,
      email: fields[1] as String?,
      verifyToken: fields[2] as String?,
      activated: fields[3] as bool?,
      createdAt: fields[4] as DateTime?,
      firstName: fields[5] as String?,
      lastName: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsletterObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.verifyToken)
      ..writeByte(3)
      ..write(obj.activated)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.firstName)
      ..writeByte(6)
      ..write(obj.lastName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsletterObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsletterObject _$NewsletterObjectFromJson(Map<String, dynamic> json) {
  return NewsletterObject(
    id: json['id'] as int?,
    email: json['email'] as String?,
    verifyToken: json['verifyToken'] as String?,
    activated: json['activated'] as bool?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$NewsletterObjectToJson(NewsletterObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'verifyToken': instance.verifyToken,
      'activated': instance.activated,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsletterRestClient implements NewsletterRestClient {
  _NewsletterRestClient(this._dio, {this.baseUrl});

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
            .compose(_dio.options, '/newsletters/registers',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<Map<String, List<NewsletterObject>>> getAllSplit(splitBy) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, List<NewsletterObject>>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'splitBy': splitBy},
                extra: _extra)
            .compose(_dio.options, '/newsletters/registers',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!.map((k, dynamic v) => MapEntry(
        k,
        (v as List)
            .map((i) => NewsletterObject.fromJson(i as Map<String, dynamic>))
            .toList()));

    return value;
  }

  @override
  Future<List<NewsletterObject>> getAll({pageById, pageByDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<NewsletterObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate
                },
                extra: _extra)
            .compose(_dio.options, '/newsletters/registers',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => NewsletterObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<NewsletterObject> post({email, firstName, lastName}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<List<NewsletterObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  'firstName': firstName,
                  'lastName': lastName
                },
                extra: _extra)
            .compose(_dio.options, '/newsletters/registers/$email',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = NewsletterObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NewsletterObject> delete({email, delete = 'true'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<List<NewsletterObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'delete': delete},
                extra: _extra)
            .compose(_dio.options, '/newsletters/registers/$email',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = NewsletterObject.fromJson(_result.data!);
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
