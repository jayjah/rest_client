import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'feedbacks_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class FeedbackRestClient implements RestInterface<FeedbackObject> {
  factory FeedbackRestClient(Dio dio, {String? baseUrl}) = _FeedbackRestClient;

  @GET("/feedbacks")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/feedbacks")
  Future<Map<String, List<FeedbackObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/feedbacks")
  Future<List<FeedbackObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //   @Header('splitBy') int? splitBy,
    //   @Header('onlyIds') bool? onlyIds,
    //   @Header('pageByIds') List<int>? pageByIds,
  });

  @GET("/feedbacks/{id}")
  Future<FeedbackObject?> getOne(@Path("id") String id);

  @PUT("/feedbacks/{id}")
  Future<FeedbackObject?> update(
      @Path('id') String id, @Body() FeedbackObject task);

  @DELETE("/feedbacks/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/feedbacks")
  Future<FeedbackObject?> post(@Body() FeedbackObject task);
}

@HiveType(typeId: 4)
@JsonSerializable()
class FeedbackObject extends HiveObject implements DataModel, DetailData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? message;
  @HiveField(3)
  DateTime? createdAt;

  FeedbackObject({
    this.id,
    this.name,
    this.createdAt,
  });

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedbackObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          createdAt == other.createdAt;

  factory FeedbackObject.fromJson(Map<String, dynamic> json) =>
      _$FeedbackObjectFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackObjectToJson(this);
  @override
  String toString() =>
      '${this.runtimeType}(id: $id,name: $name,message: $message,createdAt: ${createdAt?.toIso8601String()})';

  @override
  String? get content => '$name $message';

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => 'Name: $name';

  @override
  String? get homepageLink => null;

  @override
  String? get subHeader => 'Text: $message';

  @override
  String? get youtubeUrl => null;
}
