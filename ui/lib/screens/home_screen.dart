import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Layout(
      banner: _Banner(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: ArticleCollection()),
          Expanded(child: TagList()),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Container(
      color: green,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'conduit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Titillium',
              fontSize: 55,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 1),
                  blurRadius: 3,
                  color: Color.fromARGB(100, 0, 0, 0),
                ),
              ],
            ),
          ),
          Text(
            'A place to share your knowledge.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
