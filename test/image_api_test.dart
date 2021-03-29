import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Images', () {
    ImageRestClient image;
    setUp(() {
      image = ImageRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3',
      );
    });
    test('post', () async {
      //    final created =
      //   await image.create();
      //  expect(created, isNotNull);
    });
    test('getAll', () async {
      final allImages = await image.getAll();
      expect(allImages, isList);
    });
    test('getOne', () async {
      final getOne = await image.getOne('1');
      expect(getOne, isNotNull);
    });
    test('delete', () async {
      await image.delete('1');
      //expect(allNews, isNotNull);
    });
  });
}
