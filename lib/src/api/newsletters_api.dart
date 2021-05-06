import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'newsletters_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class NewsletterRestClient {
  factory NewsletterRestClient(Dio dio, {String? baseUrl}) =
      _NewsletterRestClient;

  @GET("/newsletters")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/newsletters")
  Future<Map<String, List<NewsletterObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/newsletters")
  Future<List<NewsletterObject>> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //@Header('splitBy') int? splitBy,
    //@Header('onlyIds') bool? onlyIds,
    //@Header('pageByIds') List<int>? pageByIds,
  });

  @GET("/newsletters/registers/{email}")
  Future<List<NewsletterObject>> registerNewsletter(
      {@Path("email") String? email});

  @GET("/newsletters/registers/{email}")
  Future<List<NewsletterObject>> unRegisterNewsletter(
      {@Path("email") String? email,
      @Header('delete') String? delete = 'true'});
}

@HiveType(typeId: 8)
@JsonSerializable()
class NewsletterObject extends HiveObject implements DataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? verifyToken;
  @HiveField(3)
  bool? activated;
  @HiveField(4)
  DateTime? createdAt;

  NewsletterObject(
      {this.id, this.email, this.verifyToken, this.activated, this.createdAt});

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsletterObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          verifyToken == other.verifyToken &&
          email == other.email &&
          activated == other.activated &&
          createdAt == other.createdAt;

  factory NewsletterObject.fromJson(Map<String, dynamic> json) =>
      _$NewsletterObjectFromJson(json);
  Map<String, dynamic> toJson() => _$NewsletterObjectToJson(this);
  @override
  NewsletterObject fromJson(Map<String, dynamic> json) =>
      NewsletterObject.fromJson(json);
  @override
  String toString() =>
      '${this.runtimeType}(id: $id,email: $email,verifyToken: $verifyToken,activated: $activated,createdAt: ${createdAt?.toIso8601String()})';
}
