part of dart_backend_client;

/// Basic rest interface
///   Any rest api should implement this interface.
abstract class RestInterface<T> {
  Future<T?> getOne(@Path("id") String id);

  Future<List<T>?> getAll(
      {@Header("pageById") int? pageById,
      @Header('pageByDate') DateTime? pageByDate,
      @Header('splitBy') int? splitBy,
      @Header('onlyIds') bool? onlyIds,
      @Header('pageByIds') List<int>? pageByIds});

  //Future<T> update(@Path('id') String id, @Body() T task);

  Future<void> delete(@Path('id') String id);

  //Future<T> post(@Body() T task);
}
