import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';

part 'news_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class NewsRestClient implements RestInterface<NewsObject> {
  factory NewsRestClient(Dio dio, {String? baseUrl}) = _NewsRestClient;

  @override
  @GET("/news")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/news")
  Future<Map<String, List<NewsObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/news")
  Future<List<NewsObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //@Header('splitBy') int? splitBy,
    // @Header('onlyIds') bool? onlyIds,
    //  @Header('pageByIds') List<int>? pageByIds,
  });

  @override
  @GET("/news/{id}")
  Future<NewsObject?> getOne(@Path("id") String id);

  @override
  @PUT("/news/{id}")
  Future<NewsObject?> update(@Path('id') String id, @Body() NewsObject task);

  @override
  @DELETE("/news/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/news")
  Future<NewsObject?> post(@Body() NewsObject task);
}

@HiveType(typeId: 1)
@JsonSerializable()
class NewsObject extends HiveObject
    implements DataModel, DetailData, ImageData {
  @override
  @HiveField(0)
  int? id;
  @override
  @HiveField(1)
  String? youtubeUrl;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? wordPressId;
  @HiveField(4)
  String? text;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? shortDescription;
  @HiveField(7)
  DateTime? createdAt;
  @HiveField(8)
  DateTime? updatedAt;
  @HiveField(9)
  ImageObject? image;

  NewsObject({
    this.id,
    this.name,
    this.shortDescription,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.youtubeUrl,
    this.title,
    this.wordPressId,
    this.text,
  });

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          createdAt == other.createdAt &&
          wordPressId == other.wordPressId &&
          title == other.title &&
          updatedAt == other.updatedAt &&
          image == other.image &&
          shortDescription == other.shortDescription &&
          text == other.text;

  factory NewsObject.fromJson(Map<String, dynamic> json) =>
      _$NewsObjectFromJson(json);
  Map<String, dynamic> toJson() => _$NewsObjectToJson(this);

  @override
  String toString() =>
      '${runtimeType}(id: $id,name: $name,title: $title,shortDescription: $shortDescription,text: $text,image: $image,createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()})';

  @override
  int? get imageId => image?.id;

  @override
  String? get content => text;

  @override
  String? get header => name;

  @override
  String? get homepageLink => null;

  @override
  String? get subHeader => shortDescription;

  @override
  DateTime? get createdDate => createdAt;
}
