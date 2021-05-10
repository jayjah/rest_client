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
      id: fields[0] as int?,
      name: fields[1] as String?,
      filePath: fields[2] as String?,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[4] as DateTime?,
      extraContent: fields[5] as String?,
      type: fields[6] as String?,
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
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.extraContent)
      ..writeByte(6)
      ..write(obj.type);
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
    id: json['id'] as int?,
    name: json['name'] as String?,
    filePath: json['filePath'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    extraContent: json['extraContent'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ImageObjectToJson(ImageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'filePath': instance.filePath,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'extraContent': instance.extraContent,
      'type': instance.type,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ImageRestClient implements ImageRestClient {
  _ImageRestClient(this._dio, {this.baseUrl});

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
            .compose(_dio.options, '/images',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<Map<String, List<ImageObject>>> getAllSplit(splitBy) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, List<ImageObject>>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'splitBy': splitBy},
                extra: _extra)
            .compose(_dio.options, '/images',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!.map((k, dynamic v) => MapEntry(
        k,
        (v as List)
            .map((i) => ImageObject.fromJson(i as Map<String, dynamic>))
            .toList()));

    return value;
  }

  @override
  Future<List<ImageObject>> getAll({pageById, pageByDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ImageObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate
                },
                extra: _extra)
            .compose(_dio.options, '/images',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ImageObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ImageObject> getOne(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/images/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ImageObject> update(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/images/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/images/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<ImageObject> postImage(filePath, name, file,
      {extraContent, type}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageObject>(Options(
                method: 'POST',
                headers: <String, dynamic>{
                  r'filePath': filePath,
                  r'name': name,
                  if (extraContent != null) r'extraContent': extraContent,
                  if (type != null) r'type': type
                },
                extra: _extra)
            .compose(_dio.options, '/images',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageObject.fromJson(_result.data!);
    return value;
  }

  @deprecated
  Future<ImageObject?> post(ImageObject obj) => throw BackendClientException(
      'API: Future<ImageObject?> post() is deprecated!\nUse API: Future<ImageObject?> postImage() instead!');

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
