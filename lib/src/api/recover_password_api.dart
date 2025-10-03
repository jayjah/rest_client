import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'recover_password_api.g.dart';

@RestApi()
abstract class RecoverPasswordClient {
  factory RecoverPasswordClient(Dio dio, {String? baseUrl}) =
      _RecoverPasswordClient;
  @POST("/users/recoverpassword/{email}")
  Future<String?> postPasswordRecover(
    @Path('email') String email,
  );

  @GET('/users/recoverpassword/{email}/{code}')
  Future<String?> validateEmailAndCode(
    @Path('email') String email,
    @Path('code') String code,
  );

  @POST("/users/recoverpassword/{email}/{code}")
  Future<String?> postNewPassword(
    @Path('email') String email,
    @Path('code') String code,
    @Body() String newPassword,
  );
}
