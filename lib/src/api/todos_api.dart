import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'todos_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TodoRestClient implements RestInterface<TodoObject> {
  factory TodoRestClient(Dio dio, {String? baseUrl}) = _TodoRestClient;

  @GET("/todos")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/todos")
  Future<Map<String, List<TodoObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/todos")
  Future<List<TodoObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //@Header('splitBy') int? splitBy,
    //@Header('onlyIds') bool? onlyIds,
    //@Header('pageByIds') List<int>? pageByIds,
  });

  @GET("/todos/{id}")
  Future<TodoObject?> getOne(@Path("id") String id);

  @PUT("/todos/{id}")
  Future<TodoObject?> update(@Path('id') String id, @Body() TodoObject task);

  @GET("/users/{userId}/todos")
  Future<List<TodoObject>?> todosOfUser(@Path('userId') String userId);

  @PUT("/users/{userId}/todos/{todoId}")
  Future<TodoObject?> todoIsDone(
      @Path('todoId') String todoId, @Path('userId') String userId);

  @DELETE("/todos/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/todos")
  Future<TodoObject?> post(@Body() TodoObject task);
}

@HiveType(typeId: 10)
@JsonSerializable()
class TodoObject extends HiveObject
    implements DataModel, CalendarDate, DetailData {
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
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          shortDescription == other.shortDescription &&
          name == other.name &&
          text == other.text &&
          isDone == other.isDone &&
          user == other.user &&
          updatedAt == other.updatedAt &&
          createdAt == other.createdAt &&
          endDate == other.endDate;

  factory TodoObject.fromJson(Map<String, dynamic> json) =>
      _$TodoObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TodoObjectToJson(this);
  @override
  String toString() =>
      '${this.runtimeType}(id: $id,name: $name,title: $title,shortDescription: $shortDescription,text: $text,isDone: $isDone,user: $user,createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()},endDate: ${endDate?.toIso8601String()})';

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
