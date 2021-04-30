import 'dart:convert';

import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:test/test.dart';

void main() {
  group('Users', () {
    late UserRestClient user;
    setUp(() {
      Client.enableLogging();
      user = UserRestClient(
        Client.getDio,
        baseUrl: 'https://movementfam.jayjah.de/v3',
      );
    });
    //test('post', () async {
    //    final created =
    //   await image.create();
    //  expect(created, isNotNull);
    //});
    test('login', () async {
      Client.authenticationToken = '';
      final authLogin = await user.login(
          'Basic ${base64.encode(utf8.encode('admin:einfachesPassowrt'))}');
      expect(authLogin, isA<UserObject>());
      expect(Client.authenticationToken, isNotEmpty);
    });
    test('getAll', () async {
      //    Client.authenticationToken =
      //       base64.encode(utf8.encode('admin:einfachesPassowrt'));
      final allUsers = await user.getAll();
      expect(allUsers, isList);
    });
    test('getAll ({pageById})', () async {
      //   Client.authenticationToken =
      //      base64.encode(utf8.encode('admin:einfachesPassowrt'));
      final allUsers = await user.getAll(pageById: 1);
      expect(allUsers, isList);
    });
    test('getAll ({pageByDate})', () async {
      //    Client.authenticationToken =
      //       base64.encode(utf8.encode('admin:einfachesPassowrt'));
      final allUsers = await user.getAll(pageByDate: DateTime.now());
      expect(allUsers, isList);
    });
    test('getAll ({splitBy})', () async {
      //    Client.authenticationToken =
      //       base64.encode(utf8.encode('admin:einfachesPassowrt'));
      final allUsers = await user.getAllSplit(5);
      expect(allUsers, isMap);
    });
    test('getAll ({onlyIds})', () async {
      //   Client.authenticationToken =
      //       base64.encode(utf8.encode('admin:einfachesPassowrt'));
      final allUsers = await user.getAllIds();
      expect(allUsers, isList);
    });
    test('getOne', () async {
      //   Client.authenticationToken =
      //       'Basic ${base64.encode(utf8.encode('admin:einfachesPassowrt'))}';
      final getOne = await user.getOne('1');
      expect(getOne, isNotNull);
    });
    // test('delete', () async {
    //   await user.delete('1');
    //   expect(true, true);
    // });
  });
}
