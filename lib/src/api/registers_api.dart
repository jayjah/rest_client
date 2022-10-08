import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'registers_api.g.dart';

@RestApi()
abstract class RegisterRestClient implements RestInterface<RegisterObject> {
  factory RegisterRestClient(Dio dio, {String? baseUrl}) = _RegisterRestClient;

  @override
  @GET("/registers")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/registers")
  Future<Map<String, List<RegisterObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/registers")
  Future<List<RegisterObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //@Header('splitBy') int? splitBy,
    //@Header('onlyIds') bool? onlyIds,
    //@Header('pageByIds') List<int>? pageByIds,
  });

  @override
  @GET("/registers/{id}")
  Future<RegisterObject?> getOne(@Path("id") String id);

  @override
  @PUT("/registers/{id}")
  Future<RegisterObject?> update(
      @Path('id') String id, @Body() RegisterObject task);

  @override
  @DELETE("/registers/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/registers")
  Future<RegisterObject?> post(@Body() RegisterObject task);
}

@HiveType(typeId: 9)
@JsonSerializable()
class RegisterObject extends HiveObject implements DataModel, DetailData {
  @override
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? verifyToken;
  @HiveField(3)
  String? firstName;
  @HiveField(4)
  String? lastName;
  @HiveField(5)
  DateTime? birthDate;
  @HiveField(6)
  String? password;
  @HiveField(7)
  bool? activated;
  @HiveField(8)
  DateTime? createdAt;

  RegisterObject(
      {this.id,
      this.email,
      this.verifyToken,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.password,
      this.activated,
      this.createdAt});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          verifyToken == other.verifyToken &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          birthDate == other.birthDate &&
          password == other.password &&
          activated == other.activated &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      verifyToken.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      birthDate.hashCode ^
      password.hashCode ^
      activated.hashCode ^
      createdAt.hashCode;

  factory RegisterObject.fromJson(Map<String, dynamic> json) =>
      _$RegisterObjectFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterObjectToJson(this);

  @override
  String toString() =>
      '$runtimeType(id: $id,firstName: $firstName,lastName: $lastName,email: $email,verifyToken: $verifyToken,activated: $activated,createdAt: ${createdAt?.toIso8601String()},birthDate: ${birthDate?.toIso8601String()})';

  @override
  String? get content => 'Name: $firstName $lastName';

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => 'ID: $id  ${email ?? ''}';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => 'verified: $activated';

  @override
  String? get youtubeUrl => null;
}
