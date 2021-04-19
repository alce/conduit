import 'package:grpc/grpc_connection_interface.dart';

import 'channel/channel.dart';
import 'services/articles.dart';
import 'services/users.dart';

class ConduitClient {
  ConduitClient(Uri uri) : _channel = makeChannel(uri);

  final ClientChannelBase _channel;

  UserService get users => UserService(_channel);
  ArticleService get articles => ArticleService(_channel);

  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}
