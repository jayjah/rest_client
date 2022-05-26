// ignore_for_file: non_constant_identifier_names

import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'status_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class StatusRestClient {
  factory StatusRestClient(Dio dio, {String? baseUrl}) = _StatusRestClient;

  @GET("/status/ping")
  Future<StatusObject?> ping();
}

@HiveType(typeId: 20)
@JsonSerializable()
class StatusObject extends HiveObject {
  @HiveField(0)
  String? status;
  @HiveField(1)
  DateTime? alive_time;
  @HiveField(2)
  String? db_reachable;

  StatusObject({
    this.status,
    this.alive_time,
    this.db_reachable,
  });

  factory StatusObject.fromJson(Map<String, dynamic> json) =>
      _$StatusObjectFromJson(json);
  Map<String, dynamic> toJson() => _$StatusObjectToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusObject &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          alive_time == other.alive_time &&
          db_reachable == other.db_reachable;

  @override
  int get hashCode =>
      status.hashCode ^ alive_time.hashCode ^ db_reachable.hashCode;

  @override
  String toString() =>
      '$runtimeType(status: $status, alive_time: ${alive_time?.toIso8601String()}. db_reachable: $db_reachable)';
}
