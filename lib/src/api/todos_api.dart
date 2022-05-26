import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'todos_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TodoRestClient implements RestInterface<TodoObject> {
  factory TodoRestClient(Dio dio, {String? baseUrl}) = _TodoRestClient;

  @override
  @GET("/todos")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/todos")
  Future<Map<String, List<TodoObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/todos")
  Future<List<TodoObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //@Header('splitBy') int? splitBy,
    //@Header('onlyIds') bool? onlyIds,
    //@Header('pageByIds') List<int>? pageByIds,
  });

  @override
  @GET("/todos/{id}")
  Future<TodoObject?> getOne(@Path("id") String id);

  @override
  @PUT("/todos/{id}")
  Future<TodoObject?> update(@Path('id') String id, @Body() TodoObject task);

  @GET("/users/{userId}/todos")
  Future<List<TodoObject>?> todosOfUser(@Path('userId') String userId);

  @PUT("/users/{userId}/todos/{todoId}")
  Future<TodoObject?> todoIsDone(
      @Path('todoId') String todoId, @Path('userId') String userId);

  @override
  @DELETE("/todos/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/todos")
  Future<TodoObject?> post(@Body() TodoObject task);
}

@HiveType(typeId: 10)
@JsonSerializable()
class TodoObject extends HiveObject
    implements DataModel, CalendarDate, DetailData {
  @override
  @HiveField(0)
  int? id;
  @HiveField(1)
  DateTime? endDate;
  @HiveField(2)
  String? title;
  @HiveField(3)
  bool? isDone;
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
  UserObject? user;

  TodoObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.createdAt,
      this.updatedAt,
      this.endDate,
      this.isDone,
      this.title,
      this.user,
      this.text});

  @override
  DateTime? get date => endDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          endDate == other.endDate &&
          title == other.title &&
          isDone == other.isDone &&
          text == other.text &&
          name == other.name &&
          shortDescription == other.shortDescription &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          user == other.user;

  @override
  int get hashCode =>
      id.hashCode ^
      endDate.hashCode ^
      title.hashCode ^
      isDone.hashCode ^
      text.hashCode ^
      name.hashCode ^
      shortDescription.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      user.hashCode;

  factory TodoObject.fromJson(Map<String, dynamic> json) =>
      _$TodoObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TodoObjectToJson(this);
  @override
  String toString() =>
      '$runtimeType(id: $id,name: $name,title: $title,shortDescription: $shortDescription,text: $text,isDone: $isDone,user: $user,createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()},endDate: ${endDate?.toIso8601String()})';

  @override
  String? get content => 'User: ${user?.id ?? ''} isDone: $isDone';

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => '${name ?? ''} ${title ?? ''}';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => '${shortDescription ?? ''} ${text ?? ''}';

  @override
  String? get youtubeUrl => null;
}
