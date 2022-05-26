import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'feedbacks_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class FeedbackRestClient implements RestInterface<FeedbackObject> {
  factory FeedbackRestClient(Dio dio, {String? baseUrl}) = _FeedbackRestClient;

  @override
  @GET("/feedbacks")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/feedbacks")
  Future<Map<String, List<FeedbackObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/feedbacks")
  Future<List<FeedbackObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //   @Header('splitBy') int? splitBy,
    //   @Header('onlyIds') bool? onlyIds,
    //   @Header('pageByIds') List<int>? pageByIds,
  });

  @override
  @GET("/feedbacks/{id}")
  Future<FeedbackObject?> getOne(@Path("id") String id);

  @override
  @PUT("/feedbacks/{id}")
  Future<FeedbackObject?> update(
      @Path('id') String id, @Body() FeedbackObject task);

  @override
  @DELETE("/feedbacks/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/feedbacks")
  Future<FeedbackObject?> post(@Body() FeedbackObject task);
}

@HiveType(typeId: 4)
@JsonSerializable()
class FeedbackObject extends HiveObject implements DataModel, DetailData {
  @override
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedbackObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          message == other.message &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ message.hashCode ^ createdAt.hashCode;

  factory FeedbackObject.fromJson(Map<String, dynamic> json) =>
      _$FeedbackObjectFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackObjectToJson(this);
  @override
  String toString() =>
      '$runtimeType(id: $id,name: $name,message: $message,createdAt: ${createdAt?.toIso8601String()})';

  @override
  String? get content => null;

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => 'Name: $name';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => 'Text: $message';

  @override
  String? get youtubeUrl => null;
}
