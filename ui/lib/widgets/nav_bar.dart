import 'package:flutter/material.dart';

import '../screens/login.dart';
import '../screens/signup.dart';
import '../theme.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext cx) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: AppBar(
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
            onPressed: () => Navigator.of(cx).pushReplacementNamed('/'),
            child: Text('Home', style: TextStyle(color: lightGray)),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(cx).pushReplacementNamed(LogInScreen.routeName),
            child: Text(
              'Sign in',
              style: TextStyle(color: lightGray),
            ),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(cx).pushReplacementNamed(SignUpScreen.routeName),
            child: Text('Sign up', style: TextStyle(color: lightGray)),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
