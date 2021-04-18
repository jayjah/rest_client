part of dart_backend_client;

abstract class Client {
  static String authenticationToken = '';
  static String guestAuthenticationToken = '';
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
