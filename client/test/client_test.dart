import 'package:conduit_client/conduit_client.dart';
import 'package:test/test.dart';

Matcher throwsWithMessage(String message) {
  return throwsA(
    predicate(
      (e) =>
          e is ConduitException &&
          e.message == message &&
          e.fieldErrors == null,
    ),
  );
}

void main() {
  final client = ConduitClient(Uri.parse('http://localhost:8080'));

  tearDownAll(() async {
    await client.shutdown();
  });

  group('AuthService', () {
    test('signup', () async {
      final user = await client.auth.signup(
        email: 'me@example.com',
        username: 'me',
        password: 'correct horse battery staple',
      );

      expect(user.token.length, 55);
      expect(user.email, 'me@example.com');
      expect(user.username, 'me');
      expect(user.bio, isNull);
      expect(user.image, isNull);
    });

    test('login', () {
      expect(
        client.auth.login(email: '', password: ''),
        throwsWithMessage('Wrong email or password'),
      );
    });
  });
}
