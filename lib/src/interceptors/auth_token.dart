part of dart_backend_client;

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor();
  final RegExp loginRoute = RegExp('([authenticate][\/][login]{1}[^/])');
  static const String authTokenResponseHeader = 'authtoken';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      options.headers.addAll(<String, dynamic>{
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        "charset": "utf-8",
        HttpHeaders.acceptEncodingHeader: "utf-8",
        "Authorization": Client.authenticationToken.isNotEmpty
            ? Client.authenticationToken
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
      final List<String>? token =
          response.headers[AuthorizationInterceptor.authTokenResponseHeader];
      if (token is List && token!.isNotEmpty) {
        Client.authenticationToken = token[0];
      } else if (token is String) {
        Client.authenticationToken = token as String;
      }
      //print(
      //    'ClientRestCommunication :: AuthValidator :: set authorization header: ${Client.authenticationToken}');
    }
    super.onResponse(response, handler);
  }
}
