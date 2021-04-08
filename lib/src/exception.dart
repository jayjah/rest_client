part of dart_backend_client;

class BackendClientException implements Exception {
  final String message;
  final int? code;
  final dynamic? response;

  const BackendClientException([this.message = "", this.code, this.response]);
}
