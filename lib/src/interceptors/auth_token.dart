part of dart_backend_client;

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor();
  final RegExp loginRoute = RegExp('([authenticate][\/][login]{1}[^/])');
  static const authTokenResponseHeader = 'authtoken';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      options.headers.addAll(<String, dynamic>{
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        "charset": "utf-8",
        HttpHeaders.acceptEncodingHeader: "utf-8",
        "Authorization": Client.authenticationToken.isNotEmpty
            ? "${Client.authenticationToken}"
            : "Basic ${Client.basicAuthenticationToken}",
      });
    } else {
      options.headers.addAll(<String, dynamic>{
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        "charset": "utf-8",
        HttpHeaders.acceptEncodingHeader: "utf-8"
      });
    }
    super.onRequest(options, handler);
  }


  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    // handle successful response of `users/[:id]`
    // to save authorization header
    if (response.statusCode == 200 &&
        response.realUri.path.contains(loginRoute) &&
        response.headers[AuthorizationInterceptor.authTokenResponseHeader] !=
            null) {
      final token =
          response.headers[AuthorizationInterceptor.authTokenResponseHeader];
      if (token is List && token!.isNotEmpty) {
        Client.authenticationToken = token[0];
      } else if (token is String) {
        Client.authenticationToken = token as String;
      }
      print(
          'ClientRestCommunication :: AuthValidator :: set authorization header: ${Client.authenticationToken}');
    }
    super.onResponse(response, handler);
  }
}

/*
class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor();

  void onRequest(RequestOptions options) async {
    // add authentication header && default headers
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      options.headers.addAll({
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        "charset": "utf-8",
        HttpHeaders.acceptEncodingHeader: "utf-8",
        "Authorization": Client.authenticationToken.isNotEmpty
            ? "${Client.authenticationToken}"
            : "Basic ${Client.guestAuthenticationToken}",
      });
    } else {
      options.headers.addAll({
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        "charset": "utf-8",
        HttpHeaders.acceptEncodingHeader: "utf-8"
      });
    }
    // config auth token
    if (options.path.contains('/config/client')) {
      options.headers.addAll({'config_x_auth_token': 'abcdefghijKlmn'});
    }

    print(
        ':: AuthorizationInterceptor ::  \n Request Path: ${options.path} Method: ${options.method} \n Headers: ${options.headers} \n Data: ${options.data}');
    return options; //continue
    // If you want to resolve the request with some custom data，
    // you can return a `Response` object or return `dio.resolve(data)`.
    // If you want to reject the request with a error message,
    // you can return a `DioError` object or return `dio.reject(errMsg)`
  }

  onResponse(Response response) async {
    // Do something with response data

    // save auth token on login response
    if (response.request.path.contains('/authenticate/login') &&
        response.statusCode == 200) {
      final authToken = response.headers.value('AuthToken');
      if (authToken != null && authToken.isNotEmpty) {
        Client.authenticationToken = authToken;
      }
    }

    return response; // continue
  }

  onError(DioError e) async {
    // Do something with response error
    return e; //continue
  }
}
*/
