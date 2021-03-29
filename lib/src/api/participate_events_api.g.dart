// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participate_events_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ParticipateEventRestClient implements ParticipateEventRestClient {
  _ParticipateEventRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<UserEventObject>> getAllOfEvent({id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/events/$id/participates',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => UserEventObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<void> unParticipateEvent(userId, eventId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(eventId, 'eventId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/users/$userId/events/$eventId/participate',
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
  Future<UserEventObject> participateEvent(userId, eventId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(eventId, 'eventId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/users/$userId/events/$eventId/participate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEventObject.fromJson(_result.data);
    return value;
  }
}
