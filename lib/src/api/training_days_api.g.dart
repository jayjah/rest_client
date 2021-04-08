// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_days_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingDateObjectAdapter extends TypeAdapter<TrainingDateObject> {
  @override
  final int typeId = 19;

  @override
  TrainingDateObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainingDateObject(
      id: fields[3] as int?,
      name: fields[0] as String?,
      shortDescription: fields[1] as String?,
      text: fields[2] as String?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
      date: fields[6] as DateTime?,
      maxParticipation: fields[8] as int?,
      isCanceled: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TrainingDateObject obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.shortDescription)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.isCanceled)
      ..writeByte(8)
      ..write(obj.maxParticipation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingDateObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingDateObject _$TrainingDateObjectFromJson(Map<String, dynamic> json) {
  return TrainingDateObject(
    id: json['id'] as int?,
    name: json['name'] as String?,
    shortDescription: json['shortDescription'] as String?,
    text: json['text'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    maxParticipation: json['maxParticipation'] as int?,
    isCanceled: json['isCanceled'] as bool?,
  );
}

Map<String, dynamic> _$TrainingDateObjectToJson(TrainingDateObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'text': instance.text,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'date': instance.date?.toIso8601String(),
      'isCanceled': instance.isCanceled,
      'maxParticipation': instance.maxParticipation,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TrainingDaysRestClient implements TrainingDaysRestClient {
  _TrainingDaysRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TrainingDateObject> cancelTraining(trainingDateId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainingDateObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainingdays/$trainingDateId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingDateObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<TrainingDateObject>> getAllTrainingDates(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TrainingDateObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'pageById': pageById,
                  r'pageByDate': pageByDate,
                  r'splitBy': splitBy,
                  r'onlyIds': onlyIds,
                  r'pageByIds': pageByIds
                },
                extra: _extra)
            .compose(_dio.options, '/trainingdays',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            TrainingDateObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<TrainingDateObject>> getTrainingDatesBetween(
      {dateFrom, dateTill}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TrainingDateObject>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainingdays/$dateFrom/$dateTill',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            TrainingDateObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<TrainingDateObject>> getTrainingDatesFromTrainingBetween(
      {trainingDateId, dateFrom, dateTill}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TrainingDateObject>>(Options(
                method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options,
                '/training/$trainingDateId/trainingdays/$dateFrom/$dateTill',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            TrainingDateObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainingDateObject> getOneTrainingDate(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainingDateObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainingdays/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingDateObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteTrainingDate(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/trainingdays/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
