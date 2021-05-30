// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_user_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExtendedDataAdapter extends TypeAdapter<ExtendedData> {
  @override
  final int typeId = 6;

  @override
  ExtendedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtendedData(
      id: fields[0] as int?,
      date: fields[1] as DateTime?,
      name: fields[2] as String?,
      shortDescription: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ExtendedData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.shortDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendedData _$ExtendedDataFromJson(Map<String, dynamic> json) {
  return ExtendedData(
    id: json['id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    name: json['name'] as String?,
    shortDescription: json['shortDescription'] as String?,
  );
}

Map<String, dynamic> _$ExtendedDataToJson(ExtendedData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'name': instance.name,
      'shortDescription': instance.shortDescription,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ExtendedUserRestClient implements ExtendedUserRestClient {
  _ExtendedUserRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ExtendedData> next(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ExtendedData>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users/$id/next',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExtendedData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ExtendedData> calenderData(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ExtendedData>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users/$id/calender/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExtendedData.fromJson(_result.data!);
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
