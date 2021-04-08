import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';

part 'events_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class EventRestClient {
  factory EventRestClient(Dio dio, {String? baseUrl}) = _EventRestClient;

  @GET("/events")
  Future<List<EventObject>> getAll(
      {@Header("pageById") int? pageById,
      @Header('pageByDate') DateTime? pageByDate,
      @Header('splitBy') int? splitBy,
      @Header('onlyIds') bool? onlyIds,
      @Header('pageByIds') List<int>? pageByIds});

  @GET("/events/{id}")
  Future<EventObject> getOne(@Path("id") String id);

  @PUT("/events/{id}")
  Future<EventObject> update(@Path('id') String id, @Body() EventObject task);

  @DELETE("/events/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/events")
  Future<EventObject> post(@Body() EventObject task);
}

@HiveType(typeId: 3)
@JsonSerializable()
class EventObject extends HiveObject {
  @HiveField(0)
  int? id;
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
  @HiveField(10)
  String? homepageLink;
  @HiveField(11)
  DateTime? startDate;
  @HiveField(12)
  DateTime? endDate;

  EventObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.youtubeUrl,
      this.title,
      this.wordPressId,
      this.homepageLink,
      this.startDate,
      this.endDate,
      this.text});

  factory EventObject.fromJson(Map<String, dynamic> json) =>
      _$EventObjectFromJson(json);
  Map<String, dynamic> toJson() => _$EventObjectToJson(this);
}
