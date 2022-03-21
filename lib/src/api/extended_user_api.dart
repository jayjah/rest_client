import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'extended_user_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ExtendedUserRestClient {
  factory ExtendedUserRestClient(Dio dio, {String? baseUrl}) =
      _ExtendedUserRestClient;

  @GET("/users/{id}/next")
  Future<Map<DateTime, List<ExtendedData>>> next(@Path("id") String id,
      {@Header('date') DateTime? now});

  @GET("/users/{id}/calender/all")
  Future<Map<DateTime, List<ExtendedData>>> calenderData(@Path("id") String id);
}

extension TypeConverter on _Type {
  String get toStringType => toString().split('.')[1];
}

@HiveType(typeId: 21)
@JsonSerializable()
class ExtendedData extends HiveObject implements DataModel, DetailData {
  @override
  @HiveField(0)
  int? id;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? shortDescription;
  @HiveField(4)
  String? type;
  // training -> trainingDateId || todo -> userId || event -> eventId
  @HiveField(5)
  int? externId;
  // training ->  trainingId || todo -> null || event -> null
  @HiveField(6)
  int? extraId;
  ExtendedData({
    this.id,
    this.date,
    this.name,
    this.shortDescription,
    this.type,
    this.externId,
    this.extraId,
  });

  factory ExtendedData.fromJson(Map<String, dynamic> json) =>
      _$ExtendedDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExtendedDataToJson(this);
  @override
  int get hashCode =>
      id.hashCode ^ runtimeType.hashCode ^ externId.hashCode ^ date.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendedData &&
          id == other.id &&
          externId == other.externId &&
          name == other.name &&
          shortDescription == other.shortDescription &&
          date == other.date;

  @override
  String toString() {
    return 'ExtendedData{id: $id, date: $date, name: $name, shortDescription: $shortDescription, type: $type, externId: $externId, extraId: $extraId}';
  }

  @override
  String? get content => null;

  @override
  DateTime? get createdDate => null;

  @override
  String? get header => '($type)    $name';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => shortDescription;

  @override
  String? get youtubeUrl => null;
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
