import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../dart_backend_client.dart';

part 'extended_user_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ExtendedUserRestClient {
  factory ExtendedUserRestClient(Dio dio, {String? baseUrl}) =
      _ExtendedUserRestClient;

  @GET("/users/{id}/next")
  Future<List<ExtendedData>> next(@Path("id") String id);

  @GET("/users/{id}/calender/all")
  Future<List<ExtendedData>> calenderData(@Path("id") String id);
}

@HiveType(typeId: 6)
@JsonSerializable()
class ExtendedData extends HiveObject implements DataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? shortDescription;

  ExtendedData({
    this.id,
    this.date,
    this.name,
    this.shortDescription,
  });

  factory ExtendedData.fromJson(Map<String, dynamic> json) =>
      _$ExtendedDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExtendedDataToJson(this);
  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendedData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          date == other.date &&
          name == other.name &&
          shortDescription == other.shortDescription;

  @override
  String toString() =>
      '${this.runtimeType}(id: $id,date: ${date?.toIso8601String()}, name: $name, shortDescription: $shortDescription)';
}

enum Role {
  @JsonValue("member")
  member,
  @JsonValue("trainer")
  trainer,
  @JsonValue("admin")
  admin,
}

enum FileType {
  @JsonValue("users")
  users,
  @JsonValue("locations")
  locations,
  @JsonValue("news")
  news,
  @JsonValue("events")
  events,
  @JsonValue("all")
  all,
  @JsonValue("create")
  create
}

enum PushTopic {
  @JsonValue("news")
  news,
  @JsonValue("events")
  events,
  @JsonValue("trainingCancel")
  trainingCancel,
  @JsonValue("adminGroup")
  adminGroup,
  @JsonValue("trainerGroup")
  trainerGroup,
  @JsonValue("memberGroup")
  memberGroup,
  @JsonValue("guestGroup")
  guestGroup
}
