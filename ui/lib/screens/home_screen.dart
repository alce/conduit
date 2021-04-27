import 'package:conduit_client/conduit_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../theme.dart';
import '../widgets/article_list.dart';
import '../widgets/nav_bar.dart';
import '../widgets/simple_chip.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    final filter = watch(articlesFilter).state;

    final showTags =
        filter.kind == FilterKind.none || filter.kind == FilterKind.tag;

    final banner =
        filter.kind == FilterKind.none || filter.kind == FilterKind.tag
            ? _HomeBanner()
            : _AuthorBanner(filter.value!);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            banner,
            Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              margin: EdgeInsets.only(top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            _ListNavigation(),
                            ArticleCollection(),
                            SizedBox(height: 20),
                            _Pagination(),
                          ],
                        ),
                      ),
                      if (showTags) Expanded(child: _TagList()),
                    ],
                  ),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return Container(
      color: green,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
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

class _AuthorBanner extends StatelessWidget {
  const _AuthorBanner(this._username);

  final String _username;

  @override
  Widget build(BuildContext cx) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      color: borderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Author Avatar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Titillium',
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _username,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}

class _TagList extends StatelessWidget {
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
          Consumer(builder: (_, watch, __) {
            return watch(tags).when(
                loading: () => Text('loading tags'),
                data: (tagList) {
                  final chips = tagList.map((tag) => SimpleChip(tag)).toList();
                  return Wrap(spacing: 5, runSpacing: 5, children: chips);
                },
                error: (_, __) => Text('Error getting tags'));
          }),
        ],
      ),
    );
  }
}

class _Pagination extends ConsumerWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    final future = watch(articles);

    return future.when(
      loading: () => Text('loading...'),
      data: (list) {
        assert(list.pageSize > 0, 'pageSize must be at least 1');
        final pageCount = (list.totalCount / list.pageSize).round();

        final pages = List.generate(pageCount, (i) {
          return OutlinedButton(
            onPressed: () {
              final filter = cx.read(articlesFilter);
              filter.state = filter.state.withPage(i + 1);
            },
            child: Text('${i + 1}'),
          );
        });

        return Wrap(spacing: 2, runSpacing: 2, children: pages);
      },
      error: (_, __) => Text('Someone messed up'),
    );
  }
}

class _ListNavigation extends ConsumerWidget {
  List<Widget> _buildChildren(BuildContext cx, ScopedReader watch) {
    final filter = watch(articlesFilter);

    switch (filter.state.kind) {
      case FilterKind.none:
      case FilterKind.tag:
        return [
          TextButton(
            onPressed: () => filter.state = ArticlesFilter.none(),
            child: Text('Global Feed'),
          ),
          if (filter.state.kind == FilterKind.tag)
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text('#${filter.state.value}',
                  style: TextStyle(color: green)),
            ),
        ];
      case FilterKind.author:
      case FilterKind.favoritedBy:
        return [
          TextButton(
            onPressed: () {
              final filter = cx.read(articlesFilter);
              filter.state = filter.state.withAuthor(filter.state.value!);
            },
            child: Text('My Articles'),
          ),
          SizedBox(width: 25),
          TextButton(
            onPressed: () {
              final filter = cx.read(articlesFilter);
              filter.state = filter.state.withFavoritedBy(filter.state.value!);
            },
            child: Text('Favorited Articles'),
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: _buildChildren(cx, watch),
      ),
    );
  }
}
