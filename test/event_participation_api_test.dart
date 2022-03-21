import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Events', () {
    late ParticipateEventRestClient events;
    setUp(() {
      Client.enableLogging();
      events = ParticipateEventRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3',
      );
    });
    test('doesParticipate', () async {
      await events.participateEvent('1', '1');
      final bool result = await events.doesUserParticipateEvent('1', '1');
      expect(result, true);
      await events.unParticipateEvent('1', '1');
    });
  });
}
