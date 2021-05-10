// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainings_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingsObjectAdapter extends TypeAdapter<TrainingsObject> {
  @override
  final int typeId = 18;

  @override
  TrainingsObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainingsObject(
      id: fields[3] as int?,
      name: fields[0] as String?,
      shortDescription: fields[1] as String?,
      text: fields[2] as String?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
      image: fields[6] as ImageObject?,
      trainer: fields[7] as TrainerObject?,
      ageFrom: fields[9] as int?,
      ageTill: fields[8] as int?,
      weekDay: fields[10] as String?,
      lastCreatedTrainingDates: fields[11] as DateTime?,
      timeFrom: fields[12] as DateTime?,
      timeTill: fields[13] as DateTime?,
      isAg: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TrainingsObject obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.trainer)
      ..writeByte(8)
      ..write(obj.ageTill)
      ..writeByte(9)
      ..write(obj.ageFrom)
      ..writeByte(10)
      ..write(obj.weekDay)
      ..writeByte(11)
      ..write(obj.lastCreatedTrainingDates)
      ..writeByte(12)
      ..write(obj.timeFrom)
      ..writeByte(13)
      ..write(obj.timeTill)
      ..writeByte(14)
      ..write(obj.isAg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingsObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingsObject _$TrainingsObjectFromJson(Map<String, dynamic> json) {
  return TrainingsObject(
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
    image: json['image'] == null
        ? null
        : ImageObject.fromJson(json['image'] as Map<String, dynamic>),
    trainer: json['trainer'] == null
        ? null
        : TrainerObject.fromJson(json['trainer'] as Map<String, dynamic>),
    ageFrom: json['ageFrom'] as int?,
    ageTill: json['ageTill'] as int?,
    weekDay: json['weekDay'] as String?,
    lastCreatedTrainingDates: json['lastCreatedTrainingDates'] == null
        ? null
        : DateTime.parse(json['lastCreatedTrainingDates'] as String),
    isAg: json['isAg'] as bool?,
    timeFrom: json['timeFrom'] == null
        ? null
        : json['timeFrom'] is String
            ? DateTime.parse(json['timeFrom'] as String)
            : json['timeFrom'] is DateTime
                ? json['timeFrom'] as DateTime
                : DateTime.parse(
                    json['timeFrom'].toString(),
                  ),
    timeTill: json['timeTill'] == null
        ? null
        : json['timeTill'] is String
            ? DateTime.parse(json['timeTill'] as String)
            : json['timeTill'] is DateTime
                ? json['timeTill'] as DateTime
                : DateTime.parse(
                    json['timeTill'].toString(),
                  ),
  );
}

Map<String, dynamic> _$TrainingsObjectToJson(TrainingsObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'text': instance.text,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
      'trainer': instance.trainer,
      'ageTill': instance.ageTill,
      'ageFrom': instance.ageFrom,
      'weekDay': instance.weekDay,
      'lastCreatedTrainingDates':
          instance.lastCreatedTrainingDates?.toIso8601String(),
      'timeFrom': instance.timeFrom?.toIso8601String(),
      'timeTill': instance.timeTill?.toIso8601String(),
      'isAg': instance.isAg,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TrainingsRestClient implements TrainingsRestClient {
  _TrainingsRestClient(this._dio, {this.baseUrl});

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
            .compose(_dio.options, '/trainings',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<Map<String, List<TrainingsObject>>> getAllSplit(splitBy) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, List<TrainingsObject>>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'splitBy': splitBy},
                extra: _extra)
            .compose(_dio.options, '/trainings',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!.map((k, dynamic v) => MapEntry(
        k,
        (v as List)
            .map((i) => TrainingsObject.fromJson(i as Map<String, dynamic>))
            .toList()));

    return value;
  }

  @override
  Future<List<TrainingsObject>> getAll({pageById, pageByDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TrainingsObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate
                },
                extra: _extra)
            .compose(_dio.options, '/trainings',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => TrainingsObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainingsObject> getOne(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainingsObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainings/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingsObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TrainingsObject> update(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainingsObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainings/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingsObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/trainings/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<TrainingsObject> post(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainingsObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainings',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingsObject.fromJson(_result.data!);
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
