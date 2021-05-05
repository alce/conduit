import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import 'routes.dart';

class RoutingState extends ChangeNotifier {
  RoutingState(this._read);

  ConduitRoute _currentRoute = HomeRoute();

  final Reader _read;

  ConduitRoute get currentRoute => _currentRoute;

  set currentRoute(ConduitRoute route) {
    _currentRoute = route;
    notifyListeners();

    if (route is HomeRoute) {
      _read(articlesFilterProvider.notifier).none();
    }

    if (route is ProfileRoute) {
      _read(articlesFilterProvider.notifier).withAuthor(route.username);
    }
  }
}
