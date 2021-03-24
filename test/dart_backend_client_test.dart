import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('News', () {
    NewsRestClient news;
    setUp(() {
      news = NewsRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3/news',
      );
    });
    test('getAll', () async {
      final allNews = await news.getAll();
      expect(allNews, isList);
    });
  });
}
