import 'package:grpc/grpc_connection_interface.dart';

import '../../conduit_model.dart';
import '../conversion.dart';
import '../generated/realworld/user_service.pbgrpc.dart' hide User;

class UserService {
  UserService(ClientChannelBase channel) : _client = UserServiceClient(channel);

  final UserServiceClient _client;

  Future<User> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      throw ConduitException('Wrong email or password');
    }

    final req = LoginRequest()
      ..email = email
      ..password = password;

    try {
      return (await _client.login(req)).user.toModel();
    } on GrpcError catch (_) {
      throw ConduitException('Wrong email or password');
    }
  }

  Future<User> signup({
    required String email,
    required String username,
    required String password,
  }) async {
    final req = CreateUserRequest()
      ..username = username
      ..password = password
      ..email = email;

    try {
      return (await _client.create(req)).user.toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<User> getCurrentUser() async {
    final proto = await _client.getCurrent(GetCurrentUserRequest());
    return proto.user.toModel();
  }

  Future<User> updateUser() async {
    throw UnimplementedError();
  }

  Future<Profile> followUser(String username) async {
    final req = FollowUserRequest()..username = username;
    final proto = await _client.followUser(req);
    return proto.toModel();
  }

  Future<Profile> unFollowUser(String username) async {
    final req = FollowUserRequest()..username = username;
    final proto = await _client.unfollowUser(req);
    return proto.toModel();
  }

  Future<Profile> getProfile(String username) async {
    final req = GetProfileRequest()..username = username;
    final proto = await _client.getProfile(req);
    return proto.toModel();
  }

  Future<void> deleteUser(String username) async {
    await _client.deleteUser(DeleteUserRequest()..username = username);
  }
}
