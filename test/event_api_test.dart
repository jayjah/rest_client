import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Events', () {
    late EventRestClient events;
    setUp(() {
      Client.enableLogging();
      events = EventRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3',
      );
    });
    test('getAll', () async {
      final allEvents = await events.getAll();
      expect(allEvents, isList);
    });
    test('getOne', () async {
      final getOne = await events.getOne('1');
      expect(getOne, isNotNull);
    });
  });
}
