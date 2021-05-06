import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';
import 'users_api.dart';

part 'trainers_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TrainerRestClient implements RestInterface<TrainerObject> {
  factory TrainerRestClient(Dio dio, {String? baseUrl}) = _TrainerRestClient;

  @GET("/trainers")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/trainers")
  Future<Map<String, List<TrainerObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/trainers")
  Future<List<TrainerObject>> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //  @Header('splitBy') int? splitBy,
    //  @Header('onlyIds') bool? onlyIds,
    // @Header('pageByIds') List<int>? pageByIds,
  });

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
class TrainerObject extends HiveObject implements DataModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? shortDescription;
  @HiveField(2)
  String? text;
  @HiveField(3)
  int? id;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;
  @HiveField(6)
  ImageObject? image;
  @HiveField(7)
  UserObject? user;

  TrainerObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.text,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.image});

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainerObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          shortDescription == other.shortDescription &&
          name == other.name &&
          text == other.text &&
          image == other.image &&
          user == other.user &&
          updatedAt == other.updatedAt &&
          createdAt == other.createdAt;

  factory TrainerObject.fromJson(Map<String, dynamic> json) =>
      _$TrainerObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TrainerObjectToJson(this);
  @override
  String toString() =>
      '${this.runtimeType}(id: $id,name: $name,shortDescription: $shortDescription,text: $text,image: $image,user: $user,createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()})';
}
