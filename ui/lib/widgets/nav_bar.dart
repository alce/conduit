import 'package:conduit_client/conduit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../routing/routes.dart';
import '../theme.dart';

const linkStyle = TextStyle(color: lightGray, fontSize: 16);

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  void _navigateTo(BuildContext cx, ConduitRoute route) {
    cx.read(routingProvider).currentRoute = route;
  }

  List<Widget> _authenticatedActions(BuildContext cx, User? currentUser) {
    return [
      TextButton(
        onPressed: null,
        child: Text('New Post', style: linkStyle),
      ),
      TextButton(
        onPressed: null,
        child: Text('Settings', style: linkStyle),
      ),
      TextButton(
        onPressed: null,
        child: Text(currentUser!.username, style: linkStyle),
      ),
    ];
  }

  List<Widget> _unauthenticatedActions(BuildContext cx) {
    return [
      TextButton(
        onPressed: () => _navigateTo(cx, LoginRoute()),
        child: Text('Sign in', style: linkStyle),
      ),
      TextButton(
        onPressed: () => _navigateTo(cx, SignupRoute()),
        child: Text('Sign up', style: linkStyle),
      ),
    ];
  }

  @override
  Widget build(BuildContext cx) {
    User? user;

    return Container(
      constraints: BoxConstraints(maxWidth: maxLayoutWidth),
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () => cx.read(routingProvider).currentRoute = HomeRoute(),
          child: Text(
            'conduit',
            style: TextStyle(
              color: green,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => _navigateTo(cx, HomeRoute()),
            child: Text('Home', style: linkStyle),
          ),
          if (user != null)
            ..._authenticatedActions(cx, user)
          else
            ..._unauthenticatedActions(cx),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
