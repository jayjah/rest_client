import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Events', () {
    late EventRestClient events;
    setUp(() {
      events = EventRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3',
      );
    });
    test('post', () async {
      final created =
          await events.post(EventObject.fromJson(<String, dynamic>{}));
      expect(created, isNotNull);
    });
    test('getAll', () async {
      final allEvents = await events.getAll();
      expect(allEvents, isList);
    });
    test('getOne', () async {
      final getOne = await events.getOne('1');
      expect(getOne, isNotNull);
    });
    test('update', () async {
      final updated =
          await events.update('1', EventObject.fromJson(<String, dynamic>{}));
      expect(updated, isNotNull);
    });
    test('delete', () async {
      await events.delete('1');
    });
  });
}
