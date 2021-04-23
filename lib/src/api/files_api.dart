import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dart_backend_client.dart';

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
}
