import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../theme.dart';
import 'simple_chip.dart';

class TagList extends StatelessWidget {
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
            return watch(tagsProvider).when(
              loading: () => Text('...'),
              error: (e, __) => Text(e.toString()),
              data: (tags) {
                return Wrap(spacing: 5, runSpacing: 5, children: [
                  for (final tag in tags)
                    SimpleChip(label: tag, inverted: false)
                ]);
              },
            );
          }),
        ],
      ),
    );
  }
}
