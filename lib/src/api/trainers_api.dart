import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'trainers_api.g.dart';

@RestApi()
abstract class TrainerRestClient implements RestInterface<TrainerObject> {
  factory TrainerRestClient(Dio dio, {String? baseUrl}) = _TrainerRestClient;

  @override
  @GET("/trainers")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/trainers")
  Future<Map<String, List<TrainerObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/trainers")
  Future<List<TrainerObject>> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //  @Header('splitBy') int? splitBy,
    //  @Header('onlyIds') bool? onlyIds,
    // @Header('pageByIds') List<int>? pageByIds,
  });

  @override
  @GET("/trainers/{id}")
  Future<TrainerObject> getOne(@Path('id') String id);

  @override
  @PUT("/trainers/{id}")
  Future<TrainerObject> update(
      @Path('id') String id, @Body() TrainerObject task);

  @override
  @DELETE("/trainers/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/trainers")
  Future<TrainerObject> post(@Body() TrainerObject task);
}

@HiveType(typeId: 17)
@JsonSerializable()
class TrainerObject extends HiveObject
    implements DataModel, DetailData, ImageData {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? shortDescription;
  @HiveField(2)
  String? text;
  @override
  @HiveField(3)
  int? id;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;
  @HiveField(6)
  ImageObject? image;
  @HiveField(7)
  UserObject? user;
  @HiveField(8)
  String? ageLabel;

  TrainerObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.text,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.image,
      this.ageLabel});

  @override
  factory TrainerObject.fromJson(Map<String, dynamic> json) =>
      _$TrainerObjectFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainerObject &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          shortDescription == other.shortDescription &&
          text == other.text &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          image == other.image &&
          user == other.user &&
          ageLabel == other.ageLabel;

  @override
  int get hashCode =>
      name.hashCode ^
      shortDescription.hashCode ^
      text.hashCode ^
      id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      image.hashCode ^
      user.hashCode ^
      ageLabel.hashCode;

  Map<String, dynamic> toJson() => _$TrainerObjectToJson(this);
  @override
  String toString() =>
      '$runtimeType(id: $id,name: $name,shortDescription: $shortDescription,text: $text,image: $image,user: $user,createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()}, ageLabel: $ageLabel)';

  @override
  int? get imageId => image?.id;

  @override
  String? get content => text;

  @override
  String? get header => name;

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => shortDescription;

  @override
  String? get youtubeUrl => null;

  @override
  DateTime? get createdDate => createdAt;
}
