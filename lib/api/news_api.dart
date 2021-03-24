import 'package:dio/dio.dart';
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
  Future<NewsObject> update(@Path() String id, @Body() NewsObject task);

  @DELETE("/news/{id}")
  Future<void> delete(@Path() String id);

  @POST("/news")
  Future<NewsObject> create(@Body() NewsObject task);
}

@JsonSerializable()
class NewsObject {
  int id;
  String youtubeUrl, title, wordPressId, text;
  String name, shortDescription;
  DateTime createdAt, updatedAt;
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
