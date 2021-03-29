import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'image_api.dart';
import 'trainers_api.dart';

part 'trainings_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TrainingsRestClient {
  factory TrainingsRestClient(Dio dio, {String baseUrl}) = _TrainingsRestClient;

  @GET("/trainings")
  Future<List<TrainingsObject>> getAllTrainings(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/trainingdays")
  Future<List<TrainingsObject>> getAllTrainingDates(
      {@Header("pageById") int pageById,
      @Header('pageByDate') DateTime pageByDate,
      @Header('splitBy') int splitBy,
      @Header('onlyIds') bool onlyIds,
      @Header('pageByIds') List<int> pageByIds});

  @GET("/trainingdays/{dateFrom}/{dateTill}")
  Future<List<TrainingDateObject>> getTrainingDatesBetween({
    @Path('dateFrom') DateTime dateFrom,
    @Path('dateTill') DateTime dateTill,
  });

  @GET("/training/{trainingId}/trainingdays/{dateFrom}/{dateTill}")
  Future<List<TrainingDateObject>> getTrainingDatesFromTrainingBetween({
    @Path('trainingId') String trainingDateId,
    @Path('dateFrom') DateTime dateFrom,
    @Path('dateTill') DateTime dateTill,
  });

  @PUT("/trainingdays/{id}")
  Future<TrainingDateObject> cancelTraining(@Path('id') String trainingDateId);

  @GET("/trainings/{id}")
  Future<TrainingsObject> getOneTraining(@Path('id') String id);

  @GET("/trainingdays/{id}")
  Future<TrainingsObject> getOneTrainingDate(@Path('id') String id);

  @PUT("/trainings/{id}")
  Future<TrainingsObject> updateTraining(
      @Path('id') String id, @Body() TrainingsObject task);

  @DELETE("/trainings/{id}")
  Future<void> deleteTraining(@Path('id') String id);

  @DELETE("/trainingdays/{id}")
  Future<void> deleteTrainingDate(@Path('id') String id);

  @POST("/trainings")
  Future<TrainingsObject> postTraining(@Body() TrainingsObject task);
}

@HiveType(typeId: 18)
@JsonSerializable()
class TrainingsObject extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String shortDescription;
  @HiveField(2)
  String text;
  @HiveField(3)
  int id;
  @HiveField(4)
  DateTime createdAt;
  @HiveField(5)
  DateTime updatedAt;
  @HiveField(6)
  ImageObject image;
  @HiveField(7)
  TrainerObject trainer;
  @HiveField(8)
  int ageTill;
  @HiveField(9)
  int ageFrom;
  @HiveField(10)
  String weekDay;
  @HiveField(11)
  DateTime lastCreatedTrainingDates;
  @HiveField(12)
  DateTime timeFrom;
  @HiveField(13)
  DateTime timeTill;
  @HiveField(14)
  bool isAg;

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

  factory TrainingsObject.fromJson(Map<String, dynamic> json) =>
      _$TrainingsObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingsObjectToJson(this);
}

@HiveType(typeId: 19)
@JsonSerializable()
class TrainingDateObject extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String shortDescription;
  @HiveField(2)
  String text;
  @HiveField(3)
  int id;
  @HiveField(4)
  DateTime createdAt;
  @HiveField(5)
  DateTime updatedAt;
  @HiveField(6)
  DateTime date;
  @HiveField(7)
  bool isCanceled;
  @HiveField(8)
  int maxParticipation;

  TrainingDateObject({
    this.id,
    this.name,
    this.shortDescription,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.date,
    this.maxParticipation,
    this.isCanceled,
  });

  factory TrainingDateObject.fromJson(Map<String, dynamic> json) =>
      _$TrainingDateObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingDateObjectToJson(this);
}
