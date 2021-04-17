import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';

ClientChannelBase makeChannel(Uri uri) {
  return ClientChannel(
    uri.host,
    port: uri.port,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
}
