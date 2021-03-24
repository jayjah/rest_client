/*void main() {
  group('Events', () {
    EventRestClient events;
    setUp(() {
      events = EventRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3/news',
      );
    });
    test('getAll', () async {
      final allEvents = await events.getAll();
      expect(allEvents, isList);
    });
  });
}*/
