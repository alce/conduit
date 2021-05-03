import 'package:grpc/grpc_connection_interface.dart';
import 'package:grpc/grpc_web.dart';

ClientChannelBase makeChannel(Uri uri) => GrpcWebClientChannel.xhr(uri);
