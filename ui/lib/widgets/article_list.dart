import 'package:conduit_client/conduit_client.dart';
import 'package:conduit_client/conduit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/auth_state.dart';
import '../providers.dart';
import '../screens/article_screen.dart';
import '../theme.dart';
import 'simple_chip.dart';

class ArticleCollection extends ConsumerWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    final future = watch(articles);

    return future.when(
      loading: () => Text('Loading...'),
      data: (list) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: list.articles.length,
          itemBuilder: (cx, idx) {
            final article = list.articles[idx];
            return _ArticleTile(article);
          },
        );
      },
      error: (e, __) => Text(e.toString()),
    );
  }
}

const defaultAvatar = CircleAvatar(
  backgroundImage: AssetImage('images/smiley.jpg'),
  radius: 17,
);

class _ArticleTile extends StatelessWidget {
  const _ArticleTile(this._article, {Key? key}) : super(key: key);

  final ArticleHead _article;

  @override
  Widget build(BuildContext cx) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      padding: EdgeInsets.only(top: 20, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: defaultAvatar,
            title: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  final filter = cx.read(articlesFilter);
                  filter.state =
                      filter.state.withAuthor(_article.authorUsername);
                },
                child: Text(_article.authorUsername),
              ),
            ),
            subtitle: Text(DateFormat.yMMMEd().format(_article.createdAt)),
            trailing: Consumer(builder: (_, watch, __) {
              final onPressed =
                  watch(auth) is Authenticated ? () => print('todo') : null;

              return OutlinedButton.icon(
                icon: Icon(Icons.favorite, size: 12),
                onPressed: onPressed,
                label: Text(_article.favoritesCount.toString()),
              );
            }),
          ),
          SizedBox(height: 8),
          Text(
            _article.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            _article.description,
            style: TextStyle(color: lightGray, fontSize: 16),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () =>
                    Navigator.of(cx).pushNamed(ArticleScreen.routeName),
                child: Text(
                  'Read more...',
                  style: TextStyle(color: lightGray),
                ),
              ),
              Spacer(),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: _article.tags
                    .map((t) => SimpleChip(t, inverted: true))
                    .toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
