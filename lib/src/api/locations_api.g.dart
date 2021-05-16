// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationObjectAdapter extends TypeAdapter<LocationObject> {
  @override
  final int typeId = 5;

  @override
  LocationObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationObject(
      id: fields[6] as int?,
      name: fields[5] as String?,
      shortDescription: fields[7] as String?,
      text: fields[8] as String?,
      latitude: fields[1] as num?,
      longitude: fields[0] as num?,
      address: fields[3] as String?,
      city: fields[2] as String?,
      postalCode: fields[4] as String?,
      createdAt: fields[9] as DateTime?,
      updatedAt: fields[10] as DateTime?,
      image: fields[11] as ImageObject?,
      images: (fields[12] as List?)?.cast<ImageObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocationObject obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.longitude)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.postalCode)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.shortDescription)
      ..writeByte(8)
      ..write(obj.text)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationObject _$LocationObjectFromJson(Map<String, dynamic> json) {
  return LocationObject(
    id: json['id'] as int?,
    name: json['name'] as String?,
    shortDescription: json['shortDescription'] as String?,
    text: json['text'] as String?,
    latitude: json['latitude'] as num?,
    longitude: json['longitude'] as num?,
    address: json['address'] as String?,
    city: json['city'] as String?,
    postalCode: json['postalCode'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    image: json['image'] == null
        ? null
        : ImageObject.fromJson(json['image'] as Map<String, dynamic>),
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocationObjectToJson(LocationObject instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'city': instance.city,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'name': instance.name,
      'id': instance.id,
      'shortDescription': instance.shortDescription,
      'text': instance.text,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
      'imageId': instance.image?.id,
      'images': instance.images?.toList(growable: false),
      'imagesIds': instance.images?.map((e) => e.id).toList(growable: false),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LocationRestClient implements LocationRestClient {
  _LocationRestClient(this._dio, {this.baseUrl});

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
            .compose(_dio.options, '/locations',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<Map<String, List<LocationObject>>> getAllSplit(splitBy) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, List<LocationObject>>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'splitBy': splitBy},
                extra: _extra)
            .compose(_dio.options, '/locations',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!.map((k, dynamic v) => MapEntry(
        k,
        (v as List)
            .map((i) => LocationObject.fromJson(i as Map<String, dynamic>))
            .toList()));

    return value;
  }

  @override
  Future<List<LocationObject>> getAll({pageById, pageByDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<LocationObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate
                },
                extra: _extra)
            .compose(_dio.options, '/locations',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => LocationObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<LocationObject> getOne(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LocationObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/locations/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LocationObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LocationObject> update(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LocationObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/locations/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LocationObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/locations/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<LocationObject> post(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LocationObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/locations',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LocationObject.fromJson(_result.data!);
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
