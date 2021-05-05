import 'package:conduit_client/conduit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers.dart';
import '../routing/routes.dart';
import '../theme.dart';
import 'simple_chip.dart';

const defaultAvatar = CircleAvatar(
  backgroundImage: AssetImage('images/smiley.jpg'),
  radius: 17,
);

class ArticleTile extends StatelessWidget {
  const ArticleTile(this.article, {Key? key}) : super(key: key);

  final ArticleHead article;

  void _navigateTo(BuildContext cx, ConduitRoute route) {
    cx.read(routingProvider).currentRoute = route;
  }

  @override
  Widget build(BuildContext cx) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SimpleTile(article),
          SizedBox(height: 8),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _navigateTo(cx, ArticleRoute(article.slug)),
              child: Text(
                article.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _navigateTo(cx, ArticleRoute(article.slug)),
              child: Text(
                article.description,
                style: TextStyle(color: lightGray, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () => _navigateTo(cx, ArticleRoute(article.slug)),
                child: Text('Read more...', style: TextStyle(color: lightGray)),
              ),
              Spacer(),
              Wrap(spacing: 5, runSpacing: 5, children: [
                for (final tag in article.tags)
                  SimpleChip(label: tag, inverted: true)
              ]),
            ],
          )
        ],
      ),
    );
  }
}

class _SimpleTile extends StatelessWidget {
  const _SimpleTile(this._article, {Key? key}) : super(key: key);

  final ArticleHead _article;

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
                cx.read(routingProvider).currentRoute =
                    ProfileRoute(_article.authorUsername);
              },
              child: Text(_article.authorUsername),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                DateFormat.yMMMEd().format(_article.createdAt),
                style: TextStyle(color: lightGray, fontSize: 12),
              ),
            )
          ],
        ),
        Spacer(),
        OutlinedButton.icon(
          icon: Icon(Icons.favorite, size: 12),
          onPressed: null,
          label: Text(_article.favoritesCount.toString()),
        ),
      ],
    );
  }
}
