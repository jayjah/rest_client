// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participate_trainings_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ParticipateTrainingRestClient implements ParticipateTrainingRestClient {
  _ParticipateTrainingRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TrainingDateObject>> getAllOfTraining({id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/trainings/$id/participates',
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
  Future<void> unParticipateTraining(userId, trainingId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(trainingId, 'trainingId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/users/$userId/trainings/$trainingId/participate',
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
  Future<TrainingDateObject> validateParticipationOfTraining(
      userId, trainingId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(trainingId, 'trainingId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/users/$userId/trainings/verify/$trainingId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingDateObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainingDateObject> participateTraining(userId, trainingId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(trainingId, 'trainingId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/users/$userId/trainings/$trainingId/participate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingDateObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainingDateObject> participateTrainingDate(
      userId, trainingId, trainingDateId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(trainingId, 'trainingId');
    ArgumentError.checkNotNull(trainingDateId, 'trainingDateId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/users/$userId/trainings/$trainingId/participate/date/$trainingDateId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingDateObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<TrainingDateObject> unParticipateTrainingDate(
      userId, trainingId, trainingDateId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(trainingId, 'trainingId');
    ArgumentError.checkNotNull(trainingDateId, 'trainingDateId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/users/$userId/trainings/$trainingId/participate/date/$trainingDateId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TrainingDateObject.fromJson(_result.data);
    return value;
  }
}
