import 'dart:convert';

import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('News', () {
    late NewsRestClient news;
    setUp(() {
      Client.guestAuthenticationToken =
          '${base64.encode('guest:guest'.codeUnits)}';
      Client.enableLogging();
      news = NewsRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3',
      );
    });
    test('post', () async {
      final created = await news.post(NewsObject.fromJson(<String, dynamic>{}));
      expect(created, isNotNull);
    });
    test('getAll', () async {
      final allNews = await news.getAll();
      expect(allNews, isList);
    });
    test('getOne', () async {
      final getOne = await news.getOne('1');
      expect(getOne, isNotNull);
    });
    test('update', () async {
      final updated =
          await news.update('1', NewsObject.fromJson(<String, dynamic>{}));
      expect(updated, isNotNull);
    });
    test('delete', () async {
      await news.delete('1');
      //expect(allNews, isNotNull);
    });
  });
}
