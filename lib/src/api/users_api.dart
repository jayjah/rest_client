import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'users_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class UserRestClient implements RestInterface<UserObject> {
  factory UserRestClient(Dio dio, {String? baseUrl}) = _UserRestClient;

  /// [property] can have a value of `newsletter` or  `role`
  ///   Only when [property] has a value of `role` then [valueOfProperty] must be set!
  @GET("/users")
  Future<List<UserObject>> filterGetAll(
      {@Header('property') String? property,
      @Header('value') String? valueOfProperty});

  @GET("/users")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/users")
  Future<Map<String, List<UserObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/users")
  Future<List<UserObject>> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    // @Header('splitBy') int? splitBy,
    // @Header('onlyIds') bool? onlyIds,
    //@Header('pageByIds') List<int>? pageByIds,
  });

  @GET("/users/{id}")
  Future<UserObject> getOne(@Path("id") String id);

  @PUT("/users/{id}")
  Future<UserObject> update(@Path('id') String id, @Body() UserObject task);

  @DELETE("/users/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/users")
  Future<UserObject> post(@Body() UserObject task);

  @POST("/users/{id}/pushToken")
  Future<PushTokenObject> postPushToken(
      @Path('id') String id, @Body() PushTokenObject task);

  @GET('/authenticate/login')
  Future<UserObject> login(@Header('Authorization') String basicLoginToken);
}

@HiveType(typeId: 11)
@JsonSerializable()
class UserObject extends HiveObject implements DataModel, DetailData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? loginName;
  @HiveField(4)
  String? password;
  @HiveField(5)
  String? email;
  @HiveField(6)
  DateTime? birthDate;
  @HiveField(7)
  DateTime? lastLogin;
  @HiveField(8)
  bool? newsLetter;
  @HiveField(9)
  String? role;
  @HiveField(10)
  String? externalId;
  @HiveField(11)
  DateTime? createdAt;
  @HiveField(12)
  List<TodoObject>? todos;
  @HiveField(13)
  List<UserEventObject>? eventParticipates;
  @HiveField(14)
  List<UserTrainingObject>? trainingParticipates;
  @HiveField(15)
  int? creditPoints;
  UserObject(
      {this.id,
      this.firstName,
      this.lastName,
      this.createdAt,
      this.loginName,
      this.password,
      this.email,
      this.birthDate,
      this.lastLogin,
      this.newsLetter,
      this.role,
      this.externalId,
      this.eventParticipates,
      this.todos,
      this.trainingParticipates,
      this.creditPoints});

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          loginName == other.loginName &&
          newsLetter == other.newsLetter &&
          email == other.email &&
          externalId == other.externalId &&
          birthDate == other.birthDate &&
          creditPoints == other.creditPoints &&
          role == other.role;

  factory UserObject.fromJson(Map<String, dynamic> json) =>
      _$UserObjectFromJson(json);

  bool get isAdmin => role == 'admin';
  bool get isTrainer => role == 'trainer';
  bool get isMember => role == 'member';

  Map<String, dynamic> toJson() => _$UserObjectToJson(this);

  @override
  String toString() =>
      '${this.runtimeType}(id: $id,firstName: $firstName,lastName: $lastName,loginName: $loginName,role: $role,email: $email,creditPoints: $creditPoints,createdAt: ${createdAt?.toIso8601String()},lastLogin: ${lastLogin?.toIso8601String()},newsLetter: $newsLetter,birthDate: ${birthDate?.toIso8601String()},externalId: $externalId)';

  @override
  String? get content => '$header \n $subHeader';

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => '${firstName ?? ''} ${lastName ?? ''}';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => email;

  @override
  String? get youtubeUrl => null;
}

@HiveType(typeId: 12)
@JsonSerializable()
class PushTokenObject extends HiveObject {
  @HiveField(0)
  String? token;
  @HiveField(1)
  bool? apn;
  @HiveField(2)
  bool? hms;
  @HiveField(3)
  bool? fcm;
  PushTokenObject({this.token, this.apn, this.hms, this.fcm});
  factory PushTokenObject.fromJson(Map<String, dynamic> json) =>
      _$PushTokenObjectFromJson(json);
  Map<String, dynamic> toJson() => _$PushTokenObjectToJson(this);
}

@HiveType(typeId: 13)
@JsonSerializable()
class UserEventObject extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? shortDescription;
  @HiveField(3)
  String? text;
  @HiveField(4)
  int? eventId;

  UserEventObject({
    this.id,
    this.shortDescription,
    this.name,
    this.text,
    this.eventId,
  });
  factory UserEventObject.fromJson(Map<String, dynamic> json) =>
      _$UserEventObjectFromJson(json);
  Map<String, dynamic> toJson() => _$UserEventObjectToJson(this);
}

@HiveType(typeId: 14)
@JsonSerializable()
class UserTrainingObject extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  UserTrainingDateObject? trainingDate;

  UserTrainingObject({this.id, this.trainingDate});
  factory UserTrainingObject.fromJson(Map<String, dynamic> json) =>
      _$UserTrainingObjectFromJson(json);
  Map<String, dynamic> toJson() => _$UserTrainingObjectToJson(this);
}

@HiveType(typeId: 15)
@JsonSerializable()
class UserTrainingDateObject extends HiveObject {
  @HiveField(0)
  int? id;

  UserTrainingDateObject({
    this.id,
  });
  factory UserTrainingDateObject.fromJson(Map<String, dynamic> json) =>
      _$UserTrainingDateObjectFromJson(json);
  Map<String, dynamic> toJson() => _$UserTrainingDateObjectToJson(this);
}
