import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/auth_state.dart';
import '../providers.dart';
import '../routing/routes.dart';
import '../widgets/nav_bar.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            NavBar(),
            Container(
              margin: EdgeInsets.only(top: 20),
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  Text('Sign Up', style: TextStyle(fontSize: 40)),
                  TextButton(
                    onPressed: () =>
                        cx.read(routingProvider).currentRoute = LoginRoute(),
                    child: Text(
                      'Have an account?',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 15),
                  _SignupForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<_SignupForm> {
  var _email = '';
  var _password = '';
  var _username = '';

  Future<void> _submit(BuildContext cx) async {
    await cx.read(auth.notifier).signup(
          email: _email,
          username: _username,
          password: _password,
          onSuccess: () => Navigator.of(cx).pushNamed('/'),
        );
  }

  @override
  Widget build(BuildContext cx) {
    return Consumer(builder: (_, watch, __) {
      final state = watch(auth);

      var submitButton =
          ElevatedButton(onPressed: () => _submit(cx), child: Text('Sign up'));

      var fieldErrors = <String, String?>{
        'user_username': null,
        'user_email': null,
        'user_password': null,
      };

      if (state is AuthLoading) {
        submitButton =
            ElevatedButton(onPressed: null, child: Text('creating account..'));
      }

      if (state is AuthValidationError) {
        fieldErrors = state.fieldErrors;
      }

      return Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              errorText: fieldErrors['user_username'],
            ),
            onChanged: (val) => _username = val,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: fieldErrors['user_email'],
            ),
            onChanged: (val) => _email = val,
          ),
          SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: fieldErrors['user_password'],
            ),
            onChanged: (val) => _password = val,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: submitButton,
          ),
        ],
      );
    });
  }
}
