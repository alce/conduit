import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'routes.dart';
import 'state.dart';

class ConduitRouterDelegate extends RouterDelegate<ConduitRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ConduitRoute> {
  ConduitRouterDelegate(this._routingState)
      : navigatorKey = GlobalKey<NavigatorState>() {
    _routingState.addListener(notifyListeners);
  }

  final RoutingState _routingState;

  final _transitionDelegate = NoAnimationTransitionDelegate();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext cx) {
    return Navigator(
      key: navigatorKey,
      transitionDelegate: _transitionDelegate,
      pages: [_routingState.currentRoute.asPage()],
      onPopPage: (route, dynamic result) => route.didPop(result),
    );
  }

  @override
  Future<void> setNewRoutePath(ConduitRoute route) async =>
      _routingState.currentRoute = route;

  @override
  ConduitRoute get currentConfiguration => _routingState.currentRoute;
}

class ConduitRouteParser implements RouteInformationParser<ConduitRoute> {
  @override
  Future<ConduitRoute> parseRouteInformation(RouteInformation info) async =>
      ConduitRoute.parse(info.location);

  @override
  RouteInformation? restoreRouteInformation(ConduitRoute route) =>
      route.asRouteInfo();
}

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    required List<RouteTransitionRecord> newPageRouteHistory,
    required Map<RouteTransitionRecord?, RouteTransitionRecord>
        locationToExitingPageRoute,
    required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
        pageRouteToPagelessRoutes,
  }) {
    final results = <RouteTransitionRecord>[];

    for (final pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);
    }

    for (final exitingPageRoute in locationToExitingPageRoute.values) {
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();
        final pagelessRoutes = pageRouteToPagelessRoutes[exitingPageRoute];
        if (pagelessRoutes != null) {
          for (final pagelessRoute in pagelessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }

      results.add(exitingPageRoute);
    }
    return results;
  }
}
