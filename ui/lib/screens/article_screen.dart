import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/nav_bar.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

const lorem = '''
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis felis vel
    elit iaculis egestas. Cras lobortis rutrum semper. In quis ante in arcu
    cursus iaculis at vitae lectus. Mauris porta metus eget cursus efficitur. 
    Quisque varius blandit aliquet. Sed vulputate arcu id pretium rutrum.
    Fusce tortor nisl, vulputate placerat luctus a, faucibus id lorem. Nullam
    quis diam in erat elementum lobortis. Nunc sodales eu velit pharetra 
    eleifend. Donec sagittis dictum porta. Phasellus pellentesque finibus 
    dolor, eu tristique purus hendrerit non. Ut fringilla nibh turpis, 
    faucibus ornare arcu faucibus sed. Aliquam erat volutpat. Quisque 
    condimentum eros tristique nisl dignissim, ut tincidunt ante viverra. 
    Donec tellus lacus, laoreet a dolor et, tincidunt suscipit mi. Maecenas 
    consectetur justo ut porttitor varius.
    ''';

class ArticleScreen extends StatelessWidget {
  static const routeName = '/article';

  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            _AuthorBanner('some user'),
            Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              margin: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Text(lorem),
                  Divider(),
                  SizedBox(height: 20),
                  _Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(),
            Text('USERNAME'),
            OutlinedButton(
              onPressed: () => print('follow user'),
              child: Text('Follow User'),
            ),
            OutlinedButton(
              onPressed: () => print('Favorite Article'),
              child: Text('Favorite Article (2)'),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () =>
                    Navigator.of(cx).pushNamed(LogInScreen.routeName),
                child: Text('Sign in')),
            Text('or'),
            TextButton(
                onPressed: () =>
                    Navigator.of(cx).pushNamed(SignUpScreen.routeName),
                child: Text('sign up')),
            Text('to add comments on this article.'),
          ],
        )
      ],
    );
  }
}

class _AuthorBanner extends StatelessWidget {
  const _AuthorBanner(this._username);

  final String _username;

  @override
  Widget build(BuildContext cx) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      color: darkGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Author username',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Titillium',
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'author title and stuff',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
