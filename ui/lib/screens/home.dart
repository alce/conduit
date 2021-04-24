import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/article_list.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            _Banner(),
            Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              margin: EdgeInsets.only(top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: ArticleList()),
                  Expanded(child: _TagList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      color: green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'conduit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Titillium',
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'A place to share your knowledge.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}

class _TagList extends StatelessWidget {
  final _tags = <String>[
    'dragons',
    'Gandhi',
    'Training',
    'Hours',
    'BlackLivesMatter',
    'Roundup',
    'test',
    'Widgets',
    'Gadgets',
    ''
  ];

  @override
  Widget build(BuildContext cx) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: tagListBackground,
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular tags'),
          SizedBox(height: 7),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _tags.map((t) => _Chip(t)).toList(),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this._label, {Key? key}) : super(key: key);

  final String _label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: tagChipBackground,
      ),
      child: Text(_label, style: TextStyle(color: Colors.white)),
    );
  }
}
