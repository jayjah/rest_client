import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'configs_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ConfigRestClient {
  factory ConfigRestClient(Dio dio, {String? baseUrl}) = _ConfigRestClient;

  @GET("/config/client/{id}")
  Future<ConfigObject> get(@Path("id") String id);

  @PUT("/config/client/{id}")
  Future<ConfigObject> update(@Path('id') String id, @Body() ConfigObject task);

  @DELETE("/config/client/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/config/client")
  Future<ConfigObject> post(@Body() ConfigObject task);
}

@HiveType(typeId: 2)
@JsonSerializable()
class ConfigObject extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  bool? newsEnabled;
  @HiveField(2)
  bool? eventsEnabled;
  @HiveField(3)
  bool? locationsEnabled;
  @HiveField(4)
  bool? trainersEnabled;
  @HiveField(5)
  int? newsPerPage;
  @HiveField(6)
  int? eventsPerPage;
  @HiveField(7)
  String? gMapApiKey;
  @HiveField(8)
  String? minVersion;
  @HiveField(9)
  bool? registrationEnabled;

  ConfigObject(
      {this.id,
      this.newsEnabled,
      this.eventsEnabled,
      this.locationsEnabled,
      this.trainersEnabled,
      this.newsPerPage,
      this.eventsPerPage,
      this.gMapApiKey,
      this.minVersion,
      this.registrationEnabled});

  factory ConfigObject.fromJson(Map<String, dynamic> json) =>
      _$ConfigObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigObjectToJson(this);
}
