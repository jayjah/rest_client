part of dart_backend_client;

abstract class Client {
  // To reset this value, just set it to an empty string
  static String authenticationToken = '';
  // To reset this value, just set it to an empty string
  static String guestAuthenticationToken =
      '${base64.encode('guest:guest'.codeUnits)}';
  static final _logger = PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      request: true,
      error: true,
      responseHeader: true);
  static void enableLogging() {
    if (!_dio.interceptors.contains(_logger)) {
      _dio.interceptors.add(_logger);
    }
  }

  static final Dio _dio = Dio(BaseOptions(
      headers: {}, queryParameters: {}, contentType: 'application/json'))
    ..interceptors.add(AuthorizationInterceptor());
  static Dio get getDio => _dio;
}
