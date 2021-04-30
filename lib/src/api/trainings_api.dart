import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';
import 'trainers_api.dart';

part 'trainings_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TrainingsRestClient implements RestInterface<TrainingsObject> {
  factory TrainingsRestClient(Dio dio, {String? baseUrl}) =
      _TrainingsRestClient;

  @GET("/trainings")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/trainings")
  Future<Map<String, List<TrainingsObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/trainings")
  Future<List<TrainingsObject>> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //   @Header('splitBy') int? splitBy,
    //  @Header('onlyIds') bool? onlyIds,
    // @Header('pageByIds') List<int>? pageByIds},
  });

  @GET("/trainings/{id}")
  Future<TrainingsObject> getOne(@Path('id') String id);

  @PUT("/trainings/{id}")
  Future<TrainingsObject> update(
      @Path('id') String id, @Body() TrainingsObject task);

  @DELETE("/trainings/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/trainings")
  Future<TrainingsObject> post(@Body() TrainingsObject task);
}

@HiveType(typeId: 18)
@JsonSerializable()
class TrainingsObject extends HiveObject implements DataModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? shortDescription;
  @HiveField(2)
  String? text;
  @HiveField(3)
  int? id;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;
  @HiveField(6)
  ImageObject? image;
  @HiveField(7)
  TrainerObject? trainer;
  @HiveField(8)
  int? ageTill;
  @HiveField(9)
  int? ageFrom;
  @HiveField(10)
  String? weekDay;
  @HiveField(11)
  DateTime? lastCreatedTrainingDates;
  @HiveField(12)
  DateTime? timeFrom;
  @HiveField(13)
  DateTime? timeTill;
  @HiveField(14)
  bool? isAg;

  TrainingsObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.text,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.trainer,
      this.ageFrom,
      this.ageTill,
      this.weekDay,
      this.lastCreatedTrainingDates,
      this.timeFrom,
      this.timeTill,
      this.isAg});

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingsObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          shortDescription == other.shortDescription &&
          name == other.name &&
          text == other.text &&
          weekDay == other.weekDay &&
          timeFrom == other.timeFrom &&
          timeTill == other.timeTill &&
          image == other.image &&
          ageFrom == other.ageFrom &&
          ageTill == other.ageTill &&
          trainer == other.trainer &&
          isAg == other.isAg;

  factory TrainingsObject.fromJson(Map<String, dynamic> json) =>
      _$TrainingsObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingsObjectToJson(this);

  @override
  String toString() =>
      '${this.runtimeType}(id: $id,name: $name,shortDescription: $shortDescription,text: $text,weekDay: $weekDay,ageFrom: $ageFrom,ageTill: $ageTill,image: $image,trainer: $trainer,timeFrom: ${timeFrom?.toIso8601String()},timeTill: ${timeTill?.toIso8601String()},createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()})';
}
