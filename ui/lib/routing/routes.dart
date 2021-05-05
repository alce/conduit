import 'package:flutter/material.dart';

import '../screens/screens.dart';

@immutable
abstract class ConduitRoute {
  const ConduitRoute();

  factory ConduitRoute.parse(String? location) {
    if (location == null) {
      return NotFoundRoute();
    }

    final segments = Uri.parse(location).pathSegments;

    if (segments.isEmpty) {
      return HomeRoute();
    }

    switch (segments.first) {
      case 'login':
        return LoginRoute();
      case 'register':
        return SignupRoute();
      case 'settings':
        return SettingsRoute();
      case 'editor':
        // TODO: could these two be the same route?
        if (segments.length == 1) {
          return NewArticleRoute();
        } else {
          return EditArticleRoute(segments[1]);
        }
      case 'article':
        // ArticleRoute.parse(segments);
        if (segments.length == 1) {
          return NotFoundRoute();
        } else {
          return ArticleRoute(segments[1]);
        }
      case 'profile':
        // ProfileRoute.parse(segments);
        if (segments.length == 1) {
          return NotFoundRoute();
        } else {
          // TODO: missing /profile/:username/favorites
          return ProfileRoute(segments[1]);
        }
      default:
        return NotFoundRoute();
    }
  }

  Page<void> asPage();
  RouteInformation asRouteInfo();

  Page<void> _makePage(String key, Widget child) {
    return MaterialPage<void>(key: ValueKey(key), child: child);
  }

  RouteInformation _makeInfo(String location) {
    return RouteInformation(location: location);
  }
}

class ArticleRoute extends ConduitRoute {
  const ArticleRoute(this.slug);

  final String slug;

  @override
  Page<void> asPage() => _makePage(slug, ArticleScreen(slug));

  @override
  RouteInformation asRouteInfo() => _makeInfo('/article/$slug');
}

class HomeRoute extends ConduitRoute {
  @override
  Page<void> asPage() => _makePage('Home', HomeScreen());

  @override
  RouteInformation asRouteInfo() => _makeInfo('/');
}

class LoginRoute extends ConduitRoute {
  @override
  Page<void> asPage() => _makePage('Login', LogInScreen());

  @override
  RouteInformation asRouteInfo() => _makeInfo('/login');
}

class ProfileRoute extends ConduitRoute {
  const ProfileRoute(this.username);

  final String username;

  @override
  Page<void> asPage() => _makePage(username, ProfileScreen(username));

  @override
  RouteInformation asRouteInfo() => _makeInfo('/profile/$username');
}

class SettingsRoute extends ConduitRoute {
  @override
  Page<void> asPage() => _makePage('Settings', SettingsScreen());

  @override
  RouteInformation asRouteInfo() => _makeInfo('/settings');
}

class SignupRoute extends ConduitRoute {
  @override
  Page<void> asPage() => _makePage('Signup', SignUpScreen());

  @override
  RouteInformation asRouteInfo() => _makeInfo('/register');
}

class NewArticleRoute extends ConduitRoute {
  @override
  Page<void> asPage() => _makePage('NewArticle', EditArticleScreen());

  @override
  RouteInformation asRouteInfo() => _makeInfo('/editor');
}

class EditArticleRoute extends ConduitRoute {
  const EditArticleRoute(this.slug);

  final String slug;

  @override
  Page<void> asPage() => _makePage('Edit-$slug', EditArticleScreen(slug: slug));

  @override
  RouteInformation asRouteInfo() => _makeInfo('/editor/$slug');
}

class NotFoundRoute extends ConduitRoute {
  @override
  Page<void> asPage() => _makePage('NotFound', NotFoundScreen());

  @override
  RouteInformation asRouteInfo() => _makeInfo('/not-found');
}
