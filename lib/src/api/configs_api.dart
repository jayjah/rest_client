import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../dart_backend_client.dart';

part 'configs_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ConfigRestClient implements RestInterface<ConfigObject> {
  factory ConfigRestClient(Dio dio, {String? baseUrl}) = _ConfigRestClient;

  @GET("/config/client/{id}")
  Future<ConfigObject?> get(
      @Path("id") String id, @Header('config_x_auth_token') String xAuthToken);

  @PUT("/config/client/{id}")
  Future<ConfigObject?> update(
      @Path('id') String id, @Body() ConfigObject task);

  @DELETE("/config/client/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/config/client")
  Future<ConfigObject?> post(@Body() ConfigObject task);
}

@HiveType(typeId: 2)
@JsonSerializable()
class ConfigObject extends HiveObject implements DetailData {
  @HiveField(0)
  String? id;
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
  @HiveField(10)
  String? name;

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
      this.registrationEnabled,
      this.name});

  factory ConfigObject.fromJson(Map<String, dynamic> json) =>
      _$ConfigObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigObjectToJson(this);

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          newsEnabled == other.newsEnabled &&
          eventsEnabled == other.eventsEnabled &&
          locationsEnabled == other.locationsEnabled &&
          trainersEnabled == other.trainersEnabled &&
          newsPerPage == other.newsPerPage &&
          eventsPerPage == other.eventsPerPage &&
          gMapApiKey == other.gMapApiKey &&
          minVersion == other.minVersion &&
          registrationEnabled == other.registrationEnabled &&
          name == other.name;

  @override
  String toString() =>
      '${this.runtimeType}(name: $name,id: $id,newsEnabled: $newsEnabled,eventsEnabled: $eventsEnabled,locationsEnabled: $locationsEnabled,trainersEnabled: $trainersEnabled,newsPerPage: $newsPerPage,eventsPerPage: $eventsPerPage,gMapApiKey: $gMapApiKey,minVersion: $minVersion,registrationEnabled: $registrationEnabled)';

  @override
  String? get content => toString();

  @override
  DateTime? get createdDate => null;

  @override
  String? get header => '$name';

  @override
  String? get homepageLink => null;

  @override
  String? get subHeader => null;

  @override
  String? get youtubeUrl => null;
}
