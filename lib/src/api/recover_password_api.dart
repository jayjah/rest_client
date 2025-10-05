import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'recover_password_api.g.dart';

@RestApi()
abstract class RecoverPasswordClient {
  factory RecoverPasswordClient(Dio dio, {String? baseUrl}) =
      _RecoverPasswordClient;
  @POST("/users/recoverpassword/{email}")
  Future<RecoverPasswordResponse> postPasswordRecover(
    @Path('email') String email,
  );

  @GET('/users/recoverpassword/{email}/{code}')
  Future<RecoverPasswordResponse> validateEmailAndCode(
    @Path('email') String email,
    @Path('code') String code,
  );

  @POST("/users/recoverpassword/{email}/{code}/{password}")
  Future<RecoverPasswordResponse> postNewPassword(
    @Path('email') String email,
    @Path('code') String code,
    @Path('password') String password,
  );
}

class RecoverPasswordResponse {
  const RecoverPasswordResponse({
    required this.errorMessage,
    required this.success,
  });
  final bool success;
  final String? errorMessage;

  factory RecoverPasswordResponse.fromJson(Map<String, dynamic> json) {
    final bool success = json['status'] == 'ok';
    final String? errorMessage = json['message'] as String?;

    return RecoverPasswordResponse(
      errorMessage: errorMessage,
      success: success,
    );
  }
}
