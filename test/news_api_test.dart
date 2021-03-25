import 'dart:convert';

import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('News', () {
    NewsRestClient news;
    setUp(() {
      Client.guestAuthenticationToken =
          '${base64.encode('guest:guest'.codeUnits)}';
      news = NewsRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3/',
      );
    });
    test('getAll', () async {
      final allNews = await news.getAll();
      expect(allNews, isList);
    });
  });
}
