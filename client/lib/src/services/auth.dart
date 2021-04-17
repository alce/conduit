import 'package:grpc/grpc_connection_interface.dart';

import '../conversion.dart';
import '../generated/realworld/auth_service.pbgrpc.dart';
import '../model/exception.dart';
import '../model/user.dart';

class AuthService {
  AuthService(ClientChannelBase channel) : _client = AuthServiceClient(channel);

  final AuthServiceClient _client;

  Future<User> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      throw ConduitException('Wrong email or password');
    }

    final req = LoginRequest()
      ..email = email
      ..password = password;

    try {
      return (await _client.login(req)).toModel();
    } on GrpcError catch (_) {
      throw ConduitException('Wrong email or password');
    }
  }

  Future<User> signup({
    required String email,
    required String username,
    required String password,
  }) async {
    final req = SignupRequest()
      ..username = username
      ..password = password
      ..email = email;

    try {
      return (await _client.signup(req)).toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }
}
