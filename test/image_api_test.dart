import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Images', () {
    late ImageRestClient image;
    setUp(() {
      Client.enableLogging();
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
    test('getAll ({pageById})', () async {
      final allImages = await image.getAll(pageById: 1);
      expect(allImages, isList);
    });
    test('getAll ({pageByDate})', () async {
      final allImages = await image.getAll(pageByDate: DateTime.now());
      expect(allImages, isList);
    });
    test('getAll ({splitBy})', () async {
      final allImages = await image.getAllSplit(5);
      expect(allImages, isMap);
    });
    test('getAll ({onlyIds})', () async {
      final allImages = await image.getAllIds();
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
