// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configs_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigObjectAdapter extends TypeAdapter<ConfigObject> {
  @override
  final int typeId = 2;

  @override
  ConfigObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigObject(
      id: fields[0] as String?,
      newsEnabled: fields[1] as int?,
      eventsEnabled: fields[2] as int?,
      locationsEnabled: fields[3] as int?,
      trainersEnabled: fields[4] as int?,
      newsPerPage: fields[5] as int?,
      eventsPerPage: fields[6] as int?,
      gMapApiKey: fields[7] as String?,
      minVersion: fields[8] as String?,
      registrationEnabled: fields[9] as int?,
      name: fields[10] as String?,
      imprintPath: fields[11] as String?,
      aboutUsPath: fields[12] as String?,
      defaultYoutubeId: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigObject obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.newsEnabled)
      ..writeByte(2)
      ..write(obj.eventsEnabled)
      ..writeByte(3)
      ..write(obj.locationsEnabled)
      ..writeByte(4)
      ..write(obj.trainersEnabled)
      ..writeByte(5)
      ..write(obj.newsPerPage)
      ..writeByte(6)
      ..write(obj.eventsPerPage)
      ..writeByte(7)
      ..write(obj.gMapApiKey)
      ..writeByte(8)
      ..write(obj.minVersion)
      ..writeByte(9)
      ..write(obj.registrationEnabled)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.imprintPath)
      ..writeByte(12)
      ..write(obj.aboutUsPath)
      ..writeByte(13)
      ..write(obj.defaultYoutubeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigObject _$ConfigObjectFromJson(Map<String, dynamic> json) {
  return ConfigObject(
    id: json['id'] as String?,
    newsEnabled: json['newsEnabled'] as int?,
    eventsEnabled: json['eventsEnabled'] as int?,
    locationsEnabled: json['locationsEnabled'] as int?,
    trainersEnabled: json['trainersEnabled'] as int?,
    newsPerPage: json['newsPerPage'] as int?,
    eventsPerPage: json['eventsPerPage'] as int?,
    gMapApiKey: json['gMapApiKey'] as String?,
    minVersion: json['minVersion'] as String?,
    registrationEnabled: json['registrationEnabled'] as int?,
    name: json['name'] as String?,
    defaultYoutubeId: json['youtubeId'] as String?,
    aboutUsPath: json['aboutUsPath'] as String?,
    imprintPath: json['imprintPath'] as String?,
  );
}

Map<String, dynamic> _$ConfigObjectToJson(ConfigObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'newsEnabled': instance.newsEnabled,
      'eventsEnabled': instance.eventsEnabled,
      'locationsEnabled': instance.locationsEnabled,
      'trainersEnabled': instance.trainersEnabled,
      'newsPerPage': instance.newsPerPage,
      'eventsPerPage': instance.eventsPerPage,
      'gMapApiKey': instance.gMapApiKey,
      'minVersion': instance.minVersion,
      'registrationEnabled': instance.registrationEnabled,
      'name': instance.name,
      'imprintPath': instance.imprintPath,
      'aboutUsPath': instance.aboutUsPath,
      'youtubeId': instance.defaultYoutubeId,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ConfigRestClient implements ConfigRestClient {
  _ConfigRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ConfigObject?> get(id, xAuthToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConfigObject>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'config_x_auth_token': xAuthToken},
                extra: _extra)
            .compose(_dio.options, '/config/client/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConfigObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ConfigObject?> update(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConfigObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/config/client/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConfigObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/config/client/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<ConfigObject?> post(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConfigObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/config/client',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConfigObject.fromJson(_result.data!);
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

  @deprecated
  @override
  Future<List<ConfigObject>?> getAll({int? pageById, DateTime? pageByDate}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @deprecated
  @override
  Future<List<int>?> getAllIds({bool onlyIds = true}) {
    // TODO: implement getAllIds
    throw UnimplementedError();
  }

  @deprecated
  @override
  Future<Map<String, List<ConfigObject>>?> getAllSplit(int splitBy) {
    // TODO: implement getAllSplit
    throw UnimplementedError();
  }

  @deprecated
  @override
  Future<ConfigObject?> getOne(String id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
