import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'training_days_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class TrainingDaysRestClient {
  factory TrainingDaysRestClient(Dio dio, {String? baseUrl}) =
      _TrainingDaysRestClient;

  @PUT("/trainingdays/{id}")
  Future<TrainingDateObject> cancelTraining(@Path('id') String trainingDateId);

  @GET("/trainingdays")
  Future<List<TrainingDateObject>> getAllTrainingDates(
      {@Header('pageById') int? pageById,
      @Header('pageByDate') DateTime? pageByDate,
      @Header('splitBy') int? splitBy,
      @Header('onlyIds') bool? onlyIds,
      @Header('pageByIds') List<int>? pageByIds});

  @GET("/trainingdays/{dateFrom}/{dateTill}")
  Future<List<TrainingDateObject>> getTrainingDatesBetween({
    @Path('dateFrom') DateTime? dateFrom,
    @Path('dateTill') DateTime? dateTill,
  });

  @GET("/training/{trainingId}/trainingdays/{dateFrom}/{dateTill}")
  Future<List<TrainingDateObject>> getTrainingDatesFromTrainingBetween({
    @Path('trainingId') String? trainingDateId,
    @Path('dateFrom') DateTime? dateFrom,
    @Path('dateTill') DateTime? dateTill,
  });

  @GET("/trainingdays/{id}")
  Future<TrainingDateObject> getOneTrainingDate(@Path('id') String id);

  @DELETE("/trainingdays/{id}")
  Future<void> deleteTrainingDate(@Path('id') String id);
}

@HiveType(typeId: 19)
@JsonSerializable()
class TrainingDateObject extends HiveObject implements DataModel {
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
  DateTime? date;
  @HiveField(7)
  bool? isCanceled;
  @HiveField(8)
  int? maxParticipation;

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

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingDateObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          shortDescription == other.shortDescription &&
          name == other.name &&
          text == other.text &&
          isCanceled == other.isCanceled &&
          maxParticipation == other.maxParticipation &&
          date == other.date &&
          updatedAt == other.updatedAt &&
          createdAt == other.createdAt;

  factory TrainingDateObject.fromJson(Map<String, dynamic> json) =>
      _$TrainingDateObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingDateObjectToJson(this);
}
