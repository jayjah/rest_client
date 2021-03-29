import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'users_api.dart';

part 'todos_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TodoRestClient {
  factory TodoRestClient(Dio dio, {String baseUrl}) = _TodoRestClient;

  @GET("/todos")
  Future<List<TodoObject>> getAll(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/todos/{id}")
  Future<TodoObject> getOne(@Path("id") String id);

  @PUT("/todos/{id}")
  Future<TodoObject> update(@Path('id') String id, @Body() TodoObject task);

  @PUT("/users/{userId}/todos/{todoId}")
  Future<TodoObject> todoIsDone(
      @Path('todoId') String todoId, @Path('userId') String userId);

  @DELETE("/todos/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/todos")
  Future<TodoObject> post(@Body() TodoObject task);
}

@HiveType(typeId: 10)
@JsonSerializable()
class TodoObject extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime endDate;
  @HiveField(2)
  String title;
  @HiveField(3)
  bool isDone;
  @HiveField(4)
  String text;
  @HiveField(5)
  String name;
  @HiveField(6)
  String shortDescription;
  @HiveField(7)
  DateTime createdAt;
  @HiveField(8)
  DateTime updatedAt;
  @HiveField(9)
  UserObject user;

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

  factory TodoObject.fromJson(Map<String, dynamic> json) =>
      _$TodoObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TodoObjectToJson(this);
}
