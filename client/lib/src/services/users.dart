import 'package:grpc/grpc_connection_interface.dart';

import '../conversion.dart';
import '../generated/realworld/user_service.pbgrpc.dart';
import '../model/profile.dart';
import '../model/user.dart';

class UserService {
  UserService(ClientChannelBase channel) : _client = UserServiceClient(channel);

  final UserServiceClient _client;

  Future<User> getCurrentUser() async {
    final proto = await _client.getCurrentUser(GetCurrentUserRequest());
    return proto.toModel();
  }

  Future<User> updateUser() async {
    throw UnimplementedError();
  }

  Future<Profile> followUser(String username) async =>
      _toggleFollowUser(username);

  Future<Profile> unFollowUser(String username) async =>
      _toggleFollowUser(username);

  Future<Profile> getProfile(String username) async {
    final req = GetProfileRequest()..username = username;
    final proto = await _client.getProfile(req);
    return proto.toModel();
  }

  Future<Profile> _toggleFollowUser(String username) async {
    final req = ToggleFollowUserRequest()..username = username;
    final proto = await _client.toggleFollowUser(req);
    return proto.toModel();
  }
}
