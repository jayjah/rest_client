import 'dart:io';

import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'image_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ImageRestClient implements RestInterface<ImageObject> {
  factory ImageRestClient(Dio dio, {String? baseUrl}) = _ImageRestClient;

  @GET("/images")
  Future<List<ImageObject>?> getAll(
      {@Header("pageById") int? pageById,
      @Header('pageByDate') DateTime? pageByDate,
      @Header('splitBy') int? splitBy,
      @Header('onlyIds') bool? onlyIds,
      @Header('pageByIds') List<int>? pageByIds});

  @GET("/images/{id}")
  Future<ImageObject?> getOne(@Path('id') String id);

  @PUT("/images/{id}")
  Future<ImageObject?> update(@Path() String id, @Body() ImageObject task);

  @DELETE("/images/{id}")
  Future<void> delete(@Path('id') String id);

  @deprecated
  Future<ImageObject?> post(ImageObject obj) => throw BackendClientException(
      'API: Future<ImageObject?> post() is deprecated!\nUse API: Future<ImageObject?> postImage() instead!');

  @POST("/images")
  Future<ImageObject?> postImage(@Header('filePath') String filePath,
      @Header('name') String name, @Part() File file,
      {@Header('extraContent') String? extraContent,
      @Header('type') String? type});
}

@HiveType(typeId: 0)
@JsonSerializable()
class ImageObject extends HiveObject implements DataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? shortDescription;
  @HiveField(3)
  DateTime? createdAt;
  @HiveField(4)
  DateTime? updatedAt;
  @HiveField(5)
  String? youtubeUrl;
  @HiveField(6)
  String? title;

  ImageObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.createdAt,
      this.updatedAt,
      this.youtubeUrl,
      this.title});

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          createdAt == other.createdAt &&
          youtubeUrl == other.youtubeUrl &&
          title == other.title &&
          updatedAt == other.updatedAt;

  factory ImageObject.fromJson(Map<String, dynamic> json) =>
      _$ImageObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ImageObjectToJson(this);
}
