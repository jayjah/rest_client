import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'messages_api.g.dart';

@RestApi()
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
class MessageObject extends HiveObject implements DataModel {
  @override
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          message == other.message &&
          htmlMessage == other.htmlMessage;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ message.hashCode ^ htmlMessage.hashCode;

  @override
  String toString() =>
      '$runtimeType(id: $id,title: $title,message: $message,htmlMessage: $htmlMessage)';
}
