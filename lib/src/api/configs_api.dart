import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'configs_api.g.dart';

@RestApi()
abstract class ConfigRestClient implements RestInterface<ConfigObject> {
  factory ConfigRestClient(Dio dio, {String? baseUrl}) = _ConfigRestClient;

  @GET("/config/client/{id}")
  Future<ConfigObject?> get(
      @Path("id") String id, @Header('config_x_auth_token') String xAuthToken);

  @override
  @PUT("/config/client/{id}")
  Future<ConfigObject?> update(
      @Path('id') String id, @Body() ConfigObject task);

  @override
  @DELETE("/config/client/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/config/client")
  Future<ConfigObject?> post(@Body() ConfigObject task);
}

@HiveType(typeId: 2)
@JsonSerializable()
class ConfigObject extends HiveObject implements DetailData {
  @HiveField(0)
  String? id;
  @HiveField(1)
  int? newsEnabled;
  @HiveField(2)
  int? eventsEnabled;
  @HiveField(3)
  int? locationsEnabled;
  @HiveField(4)
  int? trainersEnabled;
  @HiveField(5)
  int? newsPerPage;
  @HiveField(6)
  int? eventsPerPage;
  @HiveField(7)
  String? gMapApiKey;
  @HiveField(8)
  String? minVersion;
  @HiveField(9)
  int? registrationEnabled;
  @HiveField(10)
  String? name;
  @HiveField(11)
  String? imprintPath;
  @HiveField(12)
  String? aboutUsPath;
  @HiveField(13)
  String? defaultYoutubeId;
  ConfigObject({
    this.id,
    this.newsEnabled,
    this.eventsEnabled,
    this.locationsEnabled,
    this.trainersEnabled,
    this.newsPerPage,
    this.eventsPerPage,
    this.gMapApiKey,
    this.minVersion,
    this.registrationEnabled,
    this.name,
    this.defaultYoutubeId,
    this.aboutUsPath,
    this.imprintPath,
  });

  factory ConfigObject.fromJson(Map<String, dynamic> json) =>
      _$ConfigObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigObjectToJson(this);

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
          name == other.name &&
          imprintPath == other.imprintPath &&
          aboutUsPath == other.aboutUsPath &&
          defaultYoutubeId == other.defaultYoutubeId;

  @override
  int get hashCode =>
      id.hashCode ^
      newsEnabled.hashCode ^
      eventsEnabled.hashCode ^
      locationsEnabled.hashCode ^
      trainersEnabled.hashCode ^
      newsPerPage.hashCode ^
      eventsPerPage.hashCode ^
      gMapApiKey.hashCode ^
      minVersion.hashCode ^
      registrationEnabled.hashCode ^
      name.hashCode ^
      imprintPath.hashCode ^
      aboutUsPath.hashCode ^
      defaultYoutubeId.hashCode;

  @override
  String toString() =>
      '$runtimeType(name: $name,id: $id,newsEnabled: $newsEnabled,eventsEnabled: $eventsEnabled,locationsEnabled: $locationsEnabled,trainersEnabled: $trainersEnabled,newsPerPage: $newsPerPage,eventsPerPage: $eventsPerPage,gMapApiKey: $gMapApiKey,minVersion: $minVersion,registrationEnabled: $registrationEnabled)';

  @override
  String? get content => toString();

  @override
  DateTime? get createdDate => null;

  @override
  String? get header => '$name';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => null;

  @override
  String? get youtubeUrl => null;
}
