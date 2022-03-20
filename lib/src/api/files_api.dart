import 'dart:io' as io;

import 'package:http/http.dart' as http;
import 'package:retrofit/retrofit.dart';

import '../../dart_backend_client.dart' hide Response;

part 'files_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class FilesRestClient {
  factory FilesRestClient(Dio dio, {String? baseUrl}) = _FilesRestClient;
  @GET("/files/files/{fileName}")
  @DioResponseType(ResponseType.plain)
  Future<String?> downloadFile(@Path("fileName") String fileName);

  @GET("/files/images/{fileName}")
  @DioResponseType(ResponseType.bytes)
  Future<List<int>?> downloadImageFile(@Path("fileName") String fileName);

  Future<http.Response> uploadFile(
    String imageName, {
    String? extraContent,
    String? type,
    List<int>? bytes,
    String? imagePath,
  });

  @deprecated
  @POST("/images/upload")
  Future<String> uploadImage(@Body() List<int> file,
      @Header('filePath') String filePath, @Header('name') String name,
      {@Header('extraContent') String? extraContent,
      @Header('type') String? type,
      @Header('boundary') String boundary = _FilesRestClient.boundary,
      @Header('Content-Type') String content = 'multipart/form-data'});
}
