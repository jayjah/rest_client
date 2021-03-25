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
    test('getAll', () async {
      final allImages = await image.getAll();
      expect(allImages, isList);
    });
  });
}
