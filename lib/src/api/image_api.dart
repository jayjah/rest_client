import 'dart:io';

import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'image_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ImageRestClient implements RestInterface<ImageObject> {
  factory ImageRestClient(Dio dio, {String? baseUrl}) = _ImageRestClient;

  @override
  @GET("/images")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/images")
  Future<Map<String, List<ImageObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/images")
  Future<List<ImageObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //@Header('splitBy') int? splitBy,
    //@Header('onlyIds') bool? onlyIds,
    // @Header('pageByIds') List<int>? pageByIds,
  });

  @override
  @GET("/images/{id}")
  Future<ImageObject?> getOne(@Path('id') String id);

  @override
  @PUT("/images/{id}")
  Future<ImageObject?> update(@Path() String id, @Body() ImageObject task);

  @override
  @DELETE("/images/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @Deprecated("use postImage Method instead!")
  Future<ImageObject?> post(ImageObject obj) => throw const BackendClientException(
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
  @override
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? filePath;
  @HiveField(3)
  DateTime? createdAt;
  @HiveField(4)
  DateTime? updatedAt;
  @HiveField(5)
  String? extraContent;

  // enum FileType { users, locations, news, events, all, create }
  @HiveField(6)
  String? type;

  ImageObject(
      {this.id,
      this.name,
      this.filePath,
      this.createdAt,
      this.updatedAt,
      this.extraContent,
      this.type});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          filePath == other.filePath &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          extraContent == other.extraContent &&
          type == other.type;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      filePath.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      extraContent.hashCode ^
      type.hashCode;

  factory ImageObject.fromJson(Map<String, dynamic> json) =>
      _$ImageObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ImageObjectToJson(this);

  @override
  String toString() =>
      '$runtimeType(id: $id,name: $name,filePath: $filePath,type: $type,extraContent: $extraContent,createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()})';
}
