import 'package:conduit_client/conduit_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final client =
    Provider((_) => ConduitClient(Uri.parse('http://localhost:8080')));
