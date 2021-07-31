part of dart_backend_client;

/// Mock Dio class for testing
class MockDio extends DioForNative {
  MockDio();
  List<dynamic>? _data;

  set data(List<dynamic> data) => _data = data;

  Future<Response<T>> _getValue<T>() {
    assert(_data != null);
    assert(_data is List<T>);

    return Future.value(
      Response(
        data: _data!.first as T,
        requestOptions: RequestOptions(path: ''),
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http GET request, which is a alias of [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> getUri<T>(
    Uri uri, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http POST request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http POST request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> postUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http PUT request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http PUT request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> putUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http HEAD request, which is a alias of [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> head<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http HEAD request, which is a alias of [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> headUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http DELETE request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http DELETE request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> deleteUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http PATCH request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }

  /// Handy method to make http PATCH request, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> patchUri<T>(
    Uri uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _getValue<T>();
  }
}
