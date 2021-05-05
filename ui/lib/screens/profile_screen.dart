import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen(this.username);

  final String username;

  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    return Layout(
      width: LayoutWidth.narrow,
      banner: _Banner(username),
      body: ArticleCollection(),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner(this._username);

  final String _username;

  @override
  Widget build(BuildContext cx) {
    return Container(
      width: double.infinity,
      color: borderColor,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: narrowLayoutWidth),
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/smiley.jpg'),
              ),
              SizedBox(height: 15),
              Text(
                _username,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.add, size: 17, color: lightGray),
                  label: Text(
                    'Follow $_username',
                    style: TextStyle(color: lightGray),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
