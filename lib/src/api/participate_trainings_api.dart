import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'training_days_api.dart';

part 'participate_trainings_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class ParticipateTrainingRestClient {
  factory ParticipateTrainingRestClient(Dio dio, {String? baseUrl}) =
      _ParticipateTrainingRestClient;

  @GET("/trainingdays/{id}/participates")
  Future<List<UserObject>> getAllOfTraining({@Path("id") int? id});

  @DELETE("/users/{userId}/trainings/{trainingId}/participate")
  Future<void> unParticipateTraining(
      @Path('userId') String userId, @Path('trainingId') String trainingId);

  @POST("/users/{userId}/trainings/verify/{trainingId}")
  Future<TrainingDateObject> validateParticipationOfTraining(
      @Path('userId') String userId, @Path('trainingId') String trainingId);

  @POST("/users/{userId}/trainings/{trainingId}/participate")
  Future<List<TrainingDateObject>?> participateTraining(
      @Path('userId') String userId, @Path('trainingId') String trainingId);

  @POST(
      "/users/{userId}/trainings/{trainingId}/participate/date/{trainingDateId}")
  Future<TrainingDateObject> participateTrainingDate(
      @Path('userId') String userId,
      @Path('trainingId') String trainingId,
      @Path('trainingDateId') String trainingDateId);

  @DELETE(
      "/users/{userId}/trainings/{trainingId}/participate/date/{trainingDateId}")
  Future<TrainingDateObject> unParticipateTrainingDate(
      @Path('userId') String userId,
      @Path('trainingId') String trainingId,
      @Path('trainingDateId') String trainingDateId);
}
