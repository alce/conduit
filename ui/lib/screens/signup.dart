import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';
import 'login.dart';

@immutable
class User {
  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.bio,
    required this.image,
  });

  final int id;
  // min 1, unique
  final String username;
  // format, unique
  final String email;
  final String? bio;
  final String? image;
}

class SignUpScreen extends StatelessWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              Text('Sign Up'),
              TextButton(
                onPressed: () {
                  Navigator.of(cx).pushReplacementNamed(LogInScreen.routeName);
                },
                child: Text('Have an account?'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 20),
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
                  child: Text('Sign up'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
