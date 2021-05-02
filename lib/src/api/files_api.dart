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

  @POST("/images/upload")
  Future<String> uploadImage(@Body() List<int> file,
      @Header('filePath') String filePath, @Header('name') String name,
      {@Header('extraContent') String? extraContent,
      @Header('type') String? type});
}
