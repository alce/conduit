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

const validPassword = 'correct horse battery staple';

void main() {
  final client = ConduitClient(Uri.parse('http://localhost:8080'));

  tearDownAll(() async {
    await client.shutdown();
  });

  group('AuthService', () {
    late User me;

    setUpAll(() async {
      me = await client.users.signup(
        email: 'me@example.com',
        username: 'me',
        password: validPassword,
      );
    });

    tearDownAll(() async {
      await client.users.deleteUser('me');
    });

    group('Signup', () {
      test('returns user with token', () async {
        expect(me.token, isNotEmpty);
        expect(me.email, 'me@example.com');
        expect(me.username, 'me');
        expect(me.bio, isNull);
        expect(me.image, isNull);
      });

      test('username must be unique', () async {
        final future = client.users.signup(
          email: 'not-me@example.com',
          username: 'me',
          password: validPassword,
        );

        expect(future, throwsWithMessage('Username is taken'));
      });
    });

    group('Login', () {
      test('returns user with token', () async {
        final user = await client.users.login(
          email: 'me@example.com',
          password: validPassword,
        );

        expect(user, me);
      });

      test('error message', () {
        final cases = [
          _Args('', ''),
          _Args('me@example.com', 'BAD_PASS'),
          _Args('BAD_EMAIL', validPassword),
          _Args('no-user@example.com', 'no-valid-here'),
        ];

        for (final _case in cases) {
          expect(
            client.users.login(email: _case.email, password: _case.password),
            throwsWithMessage('Wrong email or password'),
          );
        }
      });
    });
  });
}

class _Args {
  _Args(this.email, this.password);

  final String email;
  final String password;
}
