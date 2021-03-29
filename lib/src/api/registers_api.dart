import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'registers_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class RegisterRestClient {
  factory RegisterRestClient(Dio dio, {String baseUrl}) = _RegisterRestClient;
  @GET("/registers")
  Future<List<RegisterObject>> getAll(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/registers/{id}")
  Future<RegisterObject> getOne(@Path("id") String id);

  @PUT("/registers/{id}")
  Future<RegisterObject> update(
      @Path('id') String id, @Body() RegisterObject task);

  @DELETE("/registers/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/registers")
  Future<RegisterObject> post(@Body() RegisterObject task);
}

@HiveType(typeId: 9)
@JsonSerializable()
class RegisterObject extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String verifyToken;
  @HiveField(3)
  String firstName;
  @HiveField(4)
  String lastName;
  @HiveField(5)
  DateTime birthDate;
  @HiveField(6)
  String password;
  @HiveField(7)
  bool activated;
  @HiveField(8)
  DateTime createdAt;

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

  factory RegisterObject.fromJson(Map<String, dynamic> json) =>
      _$RegisterObjectFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterObjectToJson(this);
}
