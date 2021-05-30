import 'package:retrofit/retrofit.dart';

import '../../dart_backend_client.dart';

part 'extended_user_api.g.dart';

abstract class ExtendedUserRestClient implements RestInterface<dynamic> {
  factory ExtendedUserRestClient(Dio dio, {String? baseUrl}) =
      _ExtendedUserRestClient;

  @GET("/users/{id}/next")
  Future<List<int>?> next(@Path("id") String id);

  @GET("/users/{id}/calender/all")
  Future<List<int>?> calenderData(@Path("id") String id);
}
