import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../theme.dart';

class SimpleChip extends StatelessWidget {
  const SimpleChip({
    required this.label,
    required this.inverted,
    Key? key,
  }) : super(key: key);

  final bool inverted;
  final String label;

  @override
  Widget build(BuildContext cx) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => cx.read(articlesFilterProvider.notifier).withTag(label),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: inverted ? Border.all(color: borderColor) : null,
            color: inverted ? null : tagChipBackground,
          ),
          child: Text(
            label,
            style: TextStyle(color: inverted ? lightGray : Colors.white),
          ),
        ),
      ),
    );
  }
}
