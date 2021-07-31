import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Init', () {
    test('Init', () async {
      initModels();
    });
    test('MockDio Test', () async {
      final obj = ImageObject();
      final MockDio dio = MockDio()..data = <ImageObject>[obj];
      final val = await dio.get('');
      expect(val, isNotNull);
      expect(val.data, obj);
    });
    test('MockDio Integration Test', () async {
      final obj = ImageObject();
      final dio = MockDio()..data = [obj.toJson()];
      final restClient = ImageRestClient(dio);
      final val = await restClient.getAll();
      expect(val, isNotNull);
      expect(val!.first, obj);
    });
  });
}
