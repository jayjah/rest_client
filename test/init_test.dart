import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Init', () {
    test('Init', () async {
      initModels();
    });
    test('MockDio Test', () async {
      final ImageObject obj = ImageObject();
      final MockDio dio = MockDio()..data = <ImageObject>[obj];
      final Response<ImageObject> val = await dio.get<ImageObject>('');
      expect(val, isNotNull);
      expect(val.data, obj);
    });
    test('MockDio Integration Test', () async {
      final ImageObject obj = ImageObject();
      final MockDio dio = MockDio()
        ..data = <Map<String, dynamic>>[obj.toJson()];
      final ImageRestClient restClient = ImageRestClient(dio);
      final List<ImageObject>? val = await restClient.getAll();
      expect(val, isNotNull);
      expect(val!.first, obj);
    });
  });
}
