// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FilesRestClient implements FilesRestClient {
  _FilesRestClient(this._dio, {this.baseUrl});

  final Dio _dio;
  String? baseUrl;
  static const String boundary = '--7d82a244f2ea5xd0s046';

  @override
  Future<String> downloadFile(fileName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            responseType: ResponseType.plain)
        .compose(_dio.options, '/files/files/$fileName',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<int>> downloadImageFile(fileName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<int>>(
        Options(
                method: 'GET',
                headers: <String, dynamic>{},
                extra: _extra,
                responseType: ResponseType.bytes)
            .compose(_dio.options, '/files/images/$fileName',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<String> uploadImage(file, filePath, name,
      {extraContent,
      type,
      boundary = boundary,
      content = 'multipart/form-data'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = file;
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
            method: 'POST',
            headers: <String, dynamic>{
              r'filePath': filePath,
              r'name': name,
              if (extraContent != null) r'extraContent': extraContent,
              if (type != null) r'type': type,
              r'boundary': boundary,
              'contentType': content
            },
            extra: _extra)
        .compose(_dio.options, '/images/upload',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  @override
  Future<http.Response> uploadFile(
    String imageName, {
    String? extraContent,
    String? type,
    List<int>? bytes,
    String? imagePath,
  }) {
    late dynamic body;
    if (bytes == null && imagePath != null) {
      body = io.File(imagePath);
    } else if (bytes != null) {
      body = bytes;
    } else {
      throw const BackendClientException(
          'ERROR WRONG PARAMETERS! Weather bytes OR imagePath must be set!');
    }

    final encodedBody = const MultipartBodyParser(boundary).parse([
      FileBodyPart(
        imageName.split('.')[0],
        imageName,
        body,
      ),
    ]);
    final headers = <String, String>{
      'Content-Type': 'multipart/form-data',
      'boundary': boundary,
      'Charset': 'utf-8',
      'name': imageName,
      'filePath': imageName,
      if (type != null) 'type': type,
      if (extraContent != null) 'extraContent': extraContent,
      'authorization': Client.authenticationToken
    };

    return http.post(
      Uri.parse('${baseUrl ?? Client.getDio.options.baseUrl}/images/upload'),
      body: encodedBody,
      headers: headers,
    );
  }
}
