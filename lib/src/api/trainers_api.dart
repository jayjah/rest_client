import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';
import 'users_api.dart';

part 'trainers_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TrainerRestClient {
  factory TrainerRestClient(Dio dio, {String baseUrl}) = _TrainerRestClient;

  @GET("/trainers")
  Future<List<TrainerObject>> getAll(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/trainers/{id}")
  Future<TrainerObject> getOne(@Path('id') String id);

  @PUT("/trainers/{id}")
  Future<TrainerObject> update(
      @Path('id') String id, @Body() TrainerObject task);

  @DELETE("/trainers/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/trainers")
  Future<TrainerObject> post(@Body() TrainerObject task);
}

@HiveType(typeId: 17)
@JsonSerializable()
class TrainerObject extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String shortDescription;
  @HiveField(2)
  String text;
  @HiveField(3)
  int id;
  @HiveField(4)
  DateTime createdAt;
  @HiveField(5)
  DateTime updatedAt;
  @HiveField(6)
  ImageObject image;
  @HiveField(7)
  UserObject user;

  TrainerObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.text,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.image});

  factory TrainerObject.fromJson(Map<String, dynamic> json) =>
      _$TrainerObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TrainerObjectToJson(this);
}
