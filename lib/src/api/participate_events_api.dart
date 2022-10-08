import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:retrofit/retrofit.dart';

part 'participate_events_api.g.dart';

@RestApi()
abstract class ParticipateEventRestClient {
  factory ParticipateEventRestClient(Dio dio, {String? baseUrl}) =
      _ParticipateEventRestClient;

  @GET("/events/{id}/participates")
  Future<List<UserObject>> getAllOfEvent({@Path("id") int? id});

  @DELETE("/users/{userId}/events/{eventId}/participate")
  Future<void> unParticipateEvent(
      @Path('userId') String userId, @Path('eventId') String eventId);

  @POST("/users/{userId}/events/{eventId}/participate")
  Future<UserEventObject> participateEvent(
      @Path('userId') String userId, @Path('eventId') String eventId);

  @GET("/users/{userId}/events/{eventId}/participation")
  Future<bool> doesUserParticipateEvent(
      @Path('userId') String userId, @Path('eventId') String eventId);
}
