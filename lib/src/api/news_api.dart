import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';

part 'news_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class NewsRestClient {
  factory NewsRestClient(Dio dio, {String baseUrl}) = _NewsRestClient;

  @GET("/news")
  Future<List<NewsObject>> getAll(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/news/{id}")
  Future<NewsObject> getOne(@Path("id") String id);

  @PUT("/news/{id}")
  Future<NewsObject> update(@Path('id') String id, @Body() NewsObject task);

  @DELETE("/news/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/news")
  Future<NewsObject> post(@Body() NewsObject task);
}

@HiveType(typeId: 1)
@JsonSerializable()
class NewsObject extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String youtubeUrl;
  @HiveField(2)
  String title;
  @HiveField(3)
  String wordPressId;
  @HiveField(4)
  String text;
  @HiveField(5)
  String name;
  @HiveField(6)
  String shortDescription;
  @HiveField(7)
  DateTime createdAt;
  @HiveField(8)
  DateTime updatedAt;
  @HiveField(9)
  ImageObject image;

  NewsObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.youtubeUrl,
      this.title,
      this.wordPressId,
      this.text});

  factory NewsObject.fromJson(Map<String, dynamic> json) =>
      _$NewsObjectFromJson(json);
  Map<String, dynamic> toJson() => _$NewsObjectToJson(this);
}
