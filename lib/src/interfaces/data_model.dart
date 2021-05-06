part of dart_backend_client;

/// Basic model interface
abstract class DataModel<T extends Object> {
  int? id;

  T fromJson(Map<String, dynamic> json);
}
