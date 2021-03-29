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
      id: fields[3] as int,
      name: fields[0] as String,
      shortDescription: fields[1] as String,
      text: fields[2] as String,
      createdAt: fields[4] as DateTime,
      updatedAt: fields[5] as DateTime,
      image: fields[6] as ImageObject,
      trainer: fields[7] as TrainerObject,
      ageFrom: fields[9] as int,
      ageTill: fields[8] as int,
      weekDay: fields[10] as String,
      lastCreatedTrainingDates: fields[11] as DateTime,
      timeFrom: fields[12] as DateTime,
      timeTill: fields[13] as DateTime,
      isAg: fields[14] as bool,
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
      id: fields[3] as int,
      name: fields[0] as String,
      shortDescription: fields[1] as String,
      text: fields[2] as String,
      createdAt: fields[4] as DateTime,
      updatedAt: fields[5] as DateTime,
      date: fields[6] as DateTime,
      maxParticipation: fields[8] as int,
      isCanceled: fields[7] as bool,
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

TrainingsObject _$TrainingsObjectFromJson(Map<String, dynamic> json) {
  return TrainingsObject(
    id: json['id'] as int,
    name: json['name'] as String,
    shortDescription: json['shortDescription'] as String,
    text: json['text'] as String,
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
    ageFrom: json['ageFrom'] as int,
    ageTill: json['ageTill'] as int,
    weekDay: json['weekDay'] as String,
    lastCreatedTrainingDates: json['lastCreatedTrainingDates'] == null
        ? null
        : DateTime.parse(json['lastCreatedTrainingDates'] as String),
    timeFrom: json['timeFrom'] == null
        ? null
        : DateTime.parse(json['timeFrom'] as String),
    timeTill: json['timeTill'] == null
        ? null
        : DateTime.parse(json['timeTill'] as String),
    isAg: json['isAg'] as bool,
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

TrainingDateObject _$TrainingDateObjectFromJson(Map<String, dynamic> json) {
  return TrainingDateObject(
    id: json['id'] as int,
    name: json['name'] as String,
    shortDescription: json['shortDescription'] as String,
    text: json['text'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    maxParticipation: json['maxParticipation'] as int,
    isCanceled: json['isCanceled'] as bool,
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

class _TrainingsRestClient implements TrainingsRestClient {
  _TrainingsRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TrainingsObject>> getAllTrainings(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/trainings',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'pageById': pageById,
              r'pageByDate': pageByDate,
              r'splitBy': splitBy,
              r'onlyIds': onlyIds,
              r'pageByIds': pageByIds
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TrainingsObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<TrainingsObject>> getAllTrainingDates(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/trainingdays',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'pageById': pageById,
              r'pageByDate': pageByDate,
              r'splitBy': splitBy,
              r'onlyIds': onlyIds,
              r'pageByIds': pageByIds
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TrainingsObject.fromJson(i as Map<String, dynamic>))
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
    final _result = await _dio.request<List<dynamic>>(
        '/trainingdays/$dateFrom/$dateTill',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
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
    final _result = await _dio.request<List<dynamic>>(
        '/training/$trainingDateId/trainingdays/$dateFrom/$dateTill',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            TrainingDateObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TrainingDateObject> cancelTraining(trainingDateId) async {
    ArgumentError.checkNotNull(trainingDateId, 'trainingDateId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/trainingdays/$trainingDateId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingDateObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainingsObject> getOneTraining(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/trainings/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingsObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainingsObject> getOneTrainingDate(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/trainingdays/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingsObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainingsObject> updateTraining(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/trainings/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingsObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> deleteTraining(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/trainings/$id',
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
  Future<void> deleteTrainingDate(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/trainingdays/$id',
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
  Future<TrainingsObject> postTraining(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/trainings',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingsObject.fromJson(_result.data);
    return value;
  }
}
