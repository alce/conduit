import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';
import 'signup.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              Text('Sign In'),
              TextButton(
                onPressed: () {
                  Navigator.of(cx).pushReplacementNamed(SignUpScreen.routeName);
                },
                child: Text('Need an account?'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => print('signup'),
                  child: Text('Sign in'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
