// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participate_trainings_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ParticipateTrainingRestClient implements ParticipateTrainingRestClient {
  _ParticipateTrainingRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<TrainingDateObject>> getAllOfTraining({id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TrainingDateObject>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/trainingdays/$id/participates',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            TrainingDateObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<void> unParticipateTraining(userId, trainingId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
        .compose(
            _dio.options, '/users/$userId/trainings/$trainingId/participate',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<TrainingDateObject> validateParticipationOfTraining(
      userId, trainingId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainingDateObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/users/$userId/trainings/verify/$trainingId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingDateObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TrainingDateObject> participateTraining(userId, trainingId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrainingDateObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '/users/$userId/trainings/$trainingId/participate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingDateObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TrainingDateObject> participateTrainingDate(
      userId, trainingId, trainingDateId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        TrainingDateObject>(Options(
            method: 'POST', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            '/users/$userId/trainings/$trainingId/participate/date/$trainingDateId',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingDateObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TrainingDateObject> unParticipateTrainingDate(
      userId, trainingId, trainingDateId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        TrainingDateObject>(Options(
            method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            '/users/$userId/trainings/$trainingId/participate/date/$trainingDateId',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrainingDateObject.fromJson(_result.data!);
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
