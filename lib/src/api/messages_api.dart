import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'messages_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class MessageRestClient {
  factory MessageRestClient(Dio dio, {String? baseUrl}) = _MessageRestClient;

  @POST("/users/{userId}/sendMessage")
  Future<MessageObject> postMessageForUser(
      @Path('userId') String userId, @Body() MessageObject task);

  @POST("/newsletters")
  Future<MessageObject> postNewsletterMessage(@Body() MessageObject task);

  @POST("/pushmessage/{id}")
  Future<MessageObject> postPushMessage(
      @Path('id') String id, @Body() MessageObject task);
}

@HiveType(typeId: 6)
@JsonSerializable()
class MessageObject extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? message;
  @HiveField(3)
  String? htmlMessage;

  MessageObject({this.id, this.title, this.message, this.htmlMessage});

  factory MessageObject.fromJson(Map<String, dynamic> json) =>
      _$MessageObjectFromJson(json);
  Map<String, dynamic> toJson() => _$MessageObjectToJson(this);
}
