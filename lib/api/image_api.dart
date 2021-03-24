import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'image_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ImageRestClient {
  factory ImageRestClient(Dio dio, {String baseUrl}) = _ImageRestClient;

  @GET("/news")
  Future<List<ImageObject>> getAll(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/news/{id}")
  Future<ImageObject> getOne(@Path("id") String id);

  //PUT("/news/{id}")
  //Future<ImageObject> update(@Path() String id, @Body() ImageObject task);

  @DELETE("/news/{id}")
  Future<void> delete(@Path() String id);

  @POST("/news")
  Future<ImageObject> create(@Header('filePath') String filePath,
      @Header('name') String name, @Part() File file,
      {@Header('extraContent') String extraContent,
      @Header('type') String type});
}

@HiveType(typeId: 0)
@JsonSerializable()
class ImageObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String shortDescription;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  DateTime updatedAt;
  @HiveField(5)
  String youtubeUrl;
  @HiveField(6)
  String title;

  ImageObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.createdAt,
      this.updatedAt,
      this.youtubeUrl,
      this.title});

  factory ImageObject.fromJson(Map<String, dynamic> json) =>
      _$ImageObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ImageObjectToJson(this);
}
