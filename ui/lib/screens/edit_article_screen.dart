import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/nav_bar.dart';

class EditArticleScreen extends StatelessWidget {
  const EditArticleScreen({Key? key, this.slug}) : super(key: key);

  final String? slug;

  void _submit(BuildContext cx) {
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
                padding: EdgeInsets.symmetric(horizontal: 30),
                constraints: BoxConstraints(maxWidth: maxLayoutWidth - 200),
                child: Column(
                  children: [
                    Text('Create New Article'),
                    TextField(
                      decoration: InputDecoration(labelText: 'Article Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "What's this article about?",
                      ),
                    ),
                    TextField(
                      minLines: 10,
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Write your article (in markdown)',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter tags',
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => _submit(cx),
                        child: Text('Publish Article'))
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
