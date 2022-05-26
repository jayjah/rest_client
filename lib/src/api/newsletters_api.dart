import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'newsletters_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class NewsletterRestClient {
  factory NewsletterRestClient(Dio dio, {String? baseUrl}) =
      _NewsletterRestClient;

  @GET("/newsletters/registers")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/newsletters/registers")
  Future<Map<String, List<NewsletterObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/newsletters/registers")
  Future<List<NewsletterObject>> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //@Header('splitBy') int? splitBy,
    //@Header('onlyIds') bool? onlyIds,
    //@Header('pageByIds') List<int>? pageByIds,
  });

  @GET("/newsletters/registers/{email}")
  Future<NewsletterObject> post(
      {@Path("email") String? email,
      @Header('firstName') String? firstName,
      @Header('lastName') String? lastName});

  @GET("/newsletters/registers/{email}")
  Future<NewsletterObject> delete(
      {@Path("email") String? email,
      @Header('delete') String? delete = 'true'});
}

@HiveType(typeId: 8)
@JsonSerializable()
class NewsletterObject extends HiveObject implements DataModel, DetailData {
  @override
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
  @HiveField(5)
  String? firstName;
  @HiveField(6)
  String? lastName;

  NewsletterObject(
      {this.id,
      this.email,
      this.verifyToken,
      this.activated,
      this.createdAt,
      this.firstName,
      this.lastName});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsletterObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          verifyToken == other.verifyToken &&
          activated == other.activated &&
          createdAt == other.createdAt &&
          firstName == other.firstName &&
          lastName == other.lastName;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      verifyToken.hashCode ^
      activated.hashCode ^
      createdAt.hashCode ^
      firstName.hashCode ^
      lastName.hashCode;

  factory NewsletterObject.fromJson(Map<String, dynamic> json) =>
      _$NewsletterObjectFromJson(json);
  Map<String, dynamic> toJson() => _$NewsletterObjectToJson(this);

  @override
  String toString() =>
      '$runtimeType(id: $id,email: $email,verifyToken: $verifyToken,activated: $activated,createdAt: ${createdAt?.toIso8601String()}, firstName: $firstName, lastName: $lastName)';

  @override
  String? get content => '$firstName $lastName';

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => 'ID: $id  ${email ?? ''}';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => 'verified: $activated';

  @override
  String? get youtubeUrl => null;
}
