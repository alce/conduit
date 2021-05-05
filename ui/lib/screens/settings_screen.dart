import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../routing/routes.dart';
import '../theme.dart';
import '../widgets/nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  void _submit() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              NavBar(),
              Container(
                constraints: BoxConstraints(maxWidth: maxLayoutWidth - 500),
                margin: EdgeInsets.only(top: 35),
                child: Column(
                  children: [
                    Text('Your Settings'),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'URL of profile picture',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Short bio about you',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _submit,
                      child: Text('Update Settings'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        cx.read(auth.notifier).logout();
                        cx.read(routingProvider).currentRoute = HomeRoute();
                      },
                      child: Text('Or click here to logout.'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
