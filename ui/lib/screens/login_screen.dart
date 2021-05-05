import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/auth_state.dart';
import '../providers.dart';
import '../routing/routes.dart';
import '../widgets/nav_bar.dart';

class LogInScreen extends StatelessWidget {
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
                  Text('Sign In', style: TextStyle(fontSize: 40)),
                  TextButton(
                    onPressed: () =>
                        cx.read(routingProvider).currentRoute = SignupRoute(),
                    child: Text(
                      'Need an account?',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 15),
                  _LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  var _email = '';
  var _password = '';

  Future<void> _submit(BuildContext cx) async {
    await cx.read(auth.notifier).login(
          email: _email,
          password: _password,
          onSuccess: () => cx.read(routingProvider).currentRoute = HomeRoute(),
        );
  }

  @override
  Widget build(BuildContext cx) {
    return Consumer(builder: (_, watch, __) {
      final state = watch(auth);

      var submitButton =
          ElevatedButton(onPressed: () => _submit(cx), child: Text('Sign in'));

      if (state is AuthLoading) {
        submitButton =
            ElevatedButton(onPressed: null, child: Text('signing in...'));
      }

      return Column(
        children: [
          if (state is AuthError) ...[
            Text(state.message, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
          ],
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (val) => _email = val,
          ),
          SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
            onChanged: (val) => _password = val,
          ),
          SizedBox(height: 20),
          Align(alignment: Alignment.centerRight, child: submitButton)
        ],
      );
    });
  }
}
