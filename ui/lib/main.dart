import 'package:conduit_client/conduit_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Conduit());
}

class Conduit extends StatelessWidget {
  const Conduit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext cx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  _Home() : _client = ConduitClient(Uri.parse('http://localhost:8080'));

  final ConduitClient _client;

  @override
  Widget build(BuildContext cx) {
    final articlesFuture = _client.articles.listArticles();

    return Scaffold(
      body: FutureBuilder<ResourceList<Article>>(
        future: articlesFuture,
        builder: (cx, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.resources.length,
              itemBuilder: (cx, idx) {
                final article = snapshot.data!.resources[idx];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.slug),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('ERROR: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
