import 'package:conduit_client/conduit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../routing/routes.dart';
import '../theme.dart';
import 'article_tile.dart';

class ArticleCollection extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Column(children: [_ListNavigation(), _ArticleList()]);
  }
}

class _ListNavigation extends ConsumerWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    final currentFilter = watch(articlesFilterProvider);
    final currentRoute = watch(routingProvider).currentRoute;

    return Row(
      children: [
        if (currentRoute is HomeRoute) ...[
          _NavItem(
            label: 'Global Feed',
            active: currentFilter.kind == FilterKind.none,
            onTapped: () => cx.read(articlesFilterProvider.notifier).none(),
          ),
          if (currentFilter.kind == FilterKind.tag)
            _NavItem(label: '# ${currentFilter.value}', active: true)
        ],
        if (currentRoute is ProfileRoute) ...[
          _NavItem(
            label: 'My Articles',
            active: currentFilter.kind == FilterKind.author,
            onTapped: () => cx
                .read(articlesFilterProvider.notifier)
                .withAuthor(currentRoute.username),
          ),
          _NavItem(
            label: 'Favorited Articles',
            active: currentFilter.kind == FilterKind.favoritedBy,
            onTapped: () => cx
                .read(articlesFilterProvider.notifier)
                .favoritedBy(currentRoute.username),
          ),
        ]
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.active,
    this.onTapped,
    Key? key,
  }) : super(key: key);

  final String label;
  final bool active;
  final VoidCallback? onTapped;

  @override
  Widget build(BuildContext cx) {
    final border =
        active ? Border(bottom: BorderSide(color: green, width: 2)) : null;

    final color = active ? green : lightGray;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(border: border),
      child: TextButton(
        onPressed: onTapped,
        child: Text(label, style: TextStyle(fontSize: 16, color: color)),
      ),
    );
  }
}

class _ArticleList extends ConsumerWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    return watch(articlesProvider).when(
      loading: () => LinearProgressIndicator(
        color: green,
        backgroundColor: borderColor,
        minHeight: 1.5,
      ),
      error: (e, __) => Text(e.toString()),
      data: (articleList) {
        final articles = articleList.articles;

        if (articles.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: borderColor)),
            ),
            padding: EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('No articles here...yet.'),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: articleList.articles.length,
          itemBuilder: (cx, idx) => ArticleTile(articleList.articles[idx]),
        );
      },
    );
  }
}
