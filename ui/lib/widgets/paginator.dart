import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class Pagination extends ConsumerWidget {
  @override
  Widget build(BuildContext cx, ScopedReader watch) {
    return watch(articlesProvider).when(
      loading: () => Text('...'),
      error: (e, _) => Text(e.toString()),
      data: (articleList) {
        final pages = List.generate(articleList.totalCount, (i) {
          return OutlinedButton(
            onPressed: () {
              cx.read(articlesFilterProvider.notifier).withPage(i + 1);
            },
            child: Text('${i + 1}'),
          );
        });

        return Wrap(spacing: 2, runSpacing: 2, children: pages);
      },
    );
  }
}
