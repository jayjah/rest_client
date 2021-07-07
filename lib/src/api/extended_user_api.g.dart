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
      type: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ExtendedData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.type);
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

enum _Type { train, event, todo }

extension TypeConverter on _Type {
  String get toStringType => toString().split('.')[1];
}

ExtendedData _$ExtendedDataFromJson(Map<String, dynamic> json) {
  final type = json['isDone'] != null
      ? _Type.todo
      : json['event'] != null
          ? _Type.event
          : _Type.train;
  DateTime? date;

  switch (type) {
    case _Type.train:
      date = json['date'] == null
          ? null
          : DateTime.parse(
              '${json['date'] as String} ${json['training']['training']['timeFrom'] as String}',
            );
      break;
    default:
      date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String);
      break;
  }

  return ExtendedData(
    id: json['id'] as int?,
    date: date,
    name: json['name'] as String?,
    shortDescription: json['shortDescription'] as String?,
    type: type.toStringType,
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
  Future<List<ExtendedData>> next(id, {now}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ExtendedData>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'date': now ?? DateTime.now().toIso8601String()
                },
                extra: _extra)
            .compose(_dio.options, '/users/$id/next',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ExtendedData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Map<DateTime, List<ExtendedData>>> calenderData(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<DateTime, List<ExtendedData>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users/$id/calender/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!.map((k, dynamic v) => MapEntry(
        DateTime.parse(k),
        (v as List)
            .map((i) => ExtendedData.fromJson(i as Map<String, dynamic>))
            .toList()));

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
