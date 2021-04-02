part of dart_backend_client;

abstract class Client {
  static String authenticationToken = '';
  static String guestAuthenticationToken = '';
  static final _logger = null; //dioLoggerInterceptor;
  static void enableLogging() {
    if (!_dio.interceptors.contains(_logger)) {
      _dio.interceptors.add(_logger);
    }
  }

  static final Dio _dio = Dio(BaseOptions(
    headers: {},
    queryParameters: {},
  ))
    ..interceptors.add(AuthorizationInterceptor());
  static Dio get getDio => _dio;
}