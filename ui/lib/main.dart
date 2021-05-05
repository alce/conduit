import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'configure.dart' if (dart.library.html) 'configure_web.dart';
import 'providers.dart';
import 'routing/router.dart';
import 'routing/state.dart';
import 'theme.dart';

Future<void> main() async {
  configure();

  runApp(
    ProviderScope(
      child: Builder(builder: (cx) {
        return Conduit(
          cx.read(auth.notifier).loginFromLocalStorage(),
          cx.read(routingProvider),
        );
      }),
    ),
  );
}

class Conduit extends StatelessWidget {
  Conduit(this._authFuture, RoutingState routingState)
      : _routerDelegate = ConduitRouterDelegate(routingState);

  final Future<void> _authFuture;
  final ConduitRouterDelegate _routerDelegate;
  final _routeParser = ConduitRouteParser();

  @override
  Widget build(BuildContext cx) {
    return FutureBuilder(
      future: _authFuture,
      builder: (cx, snapshot) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerDelegate: _routerDelegate,
          routeInformationParser: _routeParser,
        );
      },
    );
  }
}
