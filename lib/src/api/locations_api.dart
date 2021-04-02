import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';

part 'locations_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class LocationRestClient {
  factory LocationRestClient(Dio dio, {String baseUrl}) = _LocationRestClient;

  @GET("/locations")
  Future<List<LocationObject>> getAll(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/locations/{id}")
  Future<LocationObject> getOne(@Path("id") String id);

  @PUT("/locations/{id}")
  Future<LocationObject> update(
      @Path('id') String id, @Body() LocationObject task);

  @DELETE("/locations/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/locations")
  Future<LocationObject> post(@Body() LocationObject task);
}

@HiveType(typeId: 5)
@JsonSerializable()
class LocationObject extends HiveObject {
  @HiveField(0)
  num longitude;
  @HiveField(1)
  num latitude;
  @HiveField(2)
  String city;
  @HiveField(3)
  String address;
  @HiveField(4)
  String postalCode;
  @HiveField(5)
  String name;
  @HiveField(6)
  int id;
  @HiveField(7)
  String shortDescription;
  @HiveField(8)
  String text;
  @HiveField(9)
  DateTime createdAt;
  @HiveField(10)
  DateTime updatedAt;
  @HiveField(11)
  ImageObject image;
  @HiveField(12)
  List<ImageObject> images;
  LocationObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.text,
      this.latitude,
      this.longitude,
      this.address,
      this.city,
      this.postalCode,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.images});

  factory LocationObject.fromJson(Map<String, dynamic> json) =>
      _$LocationObjectFromJson(json);
  Map<String, dynamic> toJson() => _$LocationObjectToJson(this);
}