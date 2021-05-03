import 'package:grpc/grpc_connection_interface.dart';

import 'channel.dart' if (dart.library.js) 'channel_web.dart';
import 'services/articles.dart';
import 'services/users.dart';

class ConduitClient {
  ConduitClient(Uri uri, [this._metadata = const {}])
      : _channel = makeChannel(uri);

  final ClientChannelBase _channel;
  final Map<String, String> _metadata;

  UserService get users => UserService(_channel, _metadata);
  ArticleService get articles => ArticleService(_channel, _metadata);

  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}
