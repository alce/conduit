import 'package:conduit_client/conduit_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers.dart';
import 'auth_state.dart';

class Auth extends StateNotifier<AuthState> {
  Auth(this._client, this._read) : super(Unauthenticated());

  static const tokenKey = '_auth_token_';

  final ConduitClient _client;
  final Reader _read;

  Future<void> signup({
    required String email,
    required String username,
    required String password,
    VoidCallback? onSuccess,
  }) async {
    state = AuthLoading();

    try {
      final user = await _client.users.signup(
        email: email,
        username: username,
        password: password,
      );

      await _storeToken(user.token);
      _read(currentUser).state = user;
      state = Authenticated();
      onSuccess?.call();
    } on ConduitException catch (e) {
      if (e.fieldErrors != null) {
        state = AuthValidationError(e.fieldErrors!);
      } else {
        state = AuthError(e.message);
      }
    }
  }

  Future<void> login({
    required String email,
    required String password,
    VoidCallback? onSuccess,
  }) async {
    state = AuthLoading();

    try {
      final user = await _client.users.login(email: email, password: password);
      await _storeToken(user.token);
      _read(currentUser).state = user;
      state = Authenticated();
      onSuccess?.call();
    } on ConduitException catch (_) {
      state = AuthError('Invalid username or password');
    }
  }

  Future<void> loginFromLocalStorage() async {
    final token = await _loadToken();

    if (token == null) {
      return;
    }

    try {
      final user = await _client.users.getCurrentUser(token);
      _read(currentUser).state = user;
      state = Authenticated();
    } on ConduitException catch (e) {
      state = AuthError(e.toString());
    }
  }

  Future<void> logout() async {
    await _clearToken();
    _read(currentUser).state = null;
    state = Unauthenticated();
  }

  Future<String?> _loadToken() async {
    final store = await SharedPreferences.getInstance();
    return store.getString(Auth.tokenKey);
  }

  Future<void> _storeToken(String token) async {
    final store = await SharedPreferences.getInstance();
    await store.setString(tokenKey, token);
  }

  Future<void> _clearToken() async {
    final store = await SharedPreferences.getInstance();
    await store.remove(tokenKey);
  }
}
