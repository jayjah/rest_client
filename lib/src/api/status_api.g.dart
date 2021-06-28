// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusObjectAdapter extends TypeAdapter<StatusObject> {
  @override
  final int typeId = 20;

  @override
  StatusObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatusObject(
      status: fields[0] as String?,
      alive_time: fields[1] as DateTime?,
      db_reachable: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, StatusObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.alive_time)
      ..writeByte(2)
      ..write(obj.db_reachable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusObject _$StatusObjectFromJson(Map<String, dynamic> json) {
  return StatusObject(
    status: json['status'] as String?,
    alive_time: json['alive_time'] == null
        ? null
        : DateTime.parse(json['alive_time'] as String),
    db_reachable: json['db_reachable'] as bool?,
  );
}

Map<String, dynamic> _$StatusObjectToJson(StatusObject instance) =>
    <String, dynamic>{
      'status': instance.status,
      'alive_time': instance.alive_time?.toIso8601String(),
      'db_reachable': instance.db_reachable,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _StatusRestClient implements StatusRestClient {
  _StatusRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<StatusObject> ping() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StatusObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/status/ping',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusObject.fromJson(_result.data!);
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
