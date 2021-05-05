import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers.dart';
import '../routing/routes.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen(this.slug, {Key? key}) : super(key: key);

  final String slug;

  @override
  Widget build(BuildContext cx) {
    return Layout(
      banner: _Banner(slug),
      body: Consumer(builder: (_, watch, __) {
        return watch(articleProvider(slug)).when(
          loading: () => Text('..loading..'),
          error: (e, __) => Text(e.toString()),
          data: (article) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.body, style: TextStyle(fontSize: 17)),
                SizedBox(height: 40),
                Wrap(spacing: 5, runSpacing: 5, children: [
                  for (final tag in article.tags)
                    SimpleChip(label: tag, inverted: true)
                ]),
                SizedBox(height: 30),
                Divider(),
                Align(
                  child: _Meta(
                    author: article.author.username,
                    createTime: article.createdAt,
                  ),
                ),
                _Footer(),
              ],
            );
          },
        );
      }),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner(this.slug);

  final String slug;

  @override
  Widget build(BuildContext cx) {
    return Container(
      color: Color(0xFF313131),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Consumer(builder: (_, watch, __) {
        return watch(articleProvider(slug)).when(
          loading: () => Text('loading'),
          error: (_, __) => Text('error'),
          data: (article) {
            return Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: maxLayoutWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Titillium',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    _Meta(
                      author: article.author.username,
                      createTime: article.createdAt,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({
    required this.author,
    required this.createTime,
    Key? key,
  }) : super(key: key);

  final String author;
  final DateTime createTime;

  @override
  Widget build(BuildContext cx) {
    return Row(
      children: [
        defaultAvatar,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                cx.read(routingProvider).currentRoute = ProfileRoute(author);
              },
              style: TextButton.styleFrom(primary: Colors.white),
              child: Text(author),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                DateFormat.yMMMEd().format(createTime),
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
            )
          ],
        ),
        OutlinedButton(
          onPressed: () {
            cx.read(routingProvider).currentRoute = ProfileRoute(author);
          },
          child: Text('Follow $author'),
        ),
        OutlinedButton(
          onPressed: null,
          child: Text('Favorite Article'),
        )
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => cx.read(routingProvider).currentRoute = LoginRoute(),
          child: Text('Sign in'),
        ),
        Text('or'),
        TextButton(
          onPressed: () =>
              cx.read(routingProvider).currentRoute = SignupRoute(),
          child: Text('sign up'),
        ),
        Text('to add comments on this article.'),
      ],
    );
  }
}
