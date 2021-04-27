import 'package:conduit_client/conduit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/auth_state.dart';
import '../providers.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../theme.dart';

const linkStyle = TextStyle(color: lightGray, fontSize: 16);

class NavBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'conduit',
          style: TextStyle(
            color: green,
            fontFamily: 'Titillium',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              cx.read(articlesFilter).state = ArticlesFilter.none();
              Navigator.of(cx).pushReplacementNamed('/');
            },
            child: Text('Home', style: linkStyle),
          ),
          if (watch(auth) is Authenticated) ...[
            TextButton(
              onPressed: () => cx.read(auth.notifier).logout(),
              child: Text('Sign out', style: linkStyle),
            ),
            TextButton(
              onPressed: () => print('navigate to profile'),
              child: Text('My Profile', style: linkStyle),
            ),
          ] else ...[
            TextButton(
              onPressed: () =>
                  Navigator.of(cx).pushReplacementNamed(LogInScreen.routeName),
              child: Text('Sign in', style: linkStyle),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(cx).pushReplacementNamed(SignUpScreen.routeName),
              child: Text('Sign up', style: linkStyle),
            ),
          ],
          SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
