import 'package:conduit_client/conduit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final articleListProvider =
    FutureProvider((ref) => ref.watch(client).articles.listArticles());

class ArticleList extends ConsumerWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    final articles = watch(articleListProvider);

    return articles.when(
      loading: () => const CircularProgressIndicator(),
      data: (articles) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: articles.resources.length,
          itemBuilder: (cx, idx) {
            final article = articles.resources[idx];
            return _ArticleTile(article);
          },
        );
      },
      error: (_, __) => Text('Someone Messed Up'),
    );
  }
}

class _ArticleTile extends StatelessWidget {
  const _ArticleTile(this._article, {Key? key}) : super(key: key);

  final Article _article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(child: Text('image')),
            title: Text(_article.author.username),
            subtitle: Text(_article.createdAt.toString()),
            trailing: Text(_article.favoritesCount.toString()),
          ),
          SizedBox(height: 10),
          Text(_article.title),
          Text(_article.description),
          SizedBox(height: 30),
          Text('Read more...')
        ],
      ),
    );
  }
}
