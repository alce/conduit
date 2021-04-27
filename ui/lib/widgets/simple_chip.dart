import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../theme.dart';

class SimpleChip extends StatelessWidget {
  const SimpleChip(this._label, {this.inverted = false, Key? key})
      : super(key: key);

  final bool inverted;

  final String _label;

  @override
  Widget build(BuildContext cx) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final filter = cx.read(articlesFilter);
          filter.state = filter.state.withTag(_label);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: inverted ? Border.all(color: borderColor) : null,
            color: inverted ? null : tagChipBackground,
          ),
          child: Text(
            _label,
            style: TextStyle(color: inverted ? lightGray : Colors.white),
          ),
        ),
      ),
    );
  }
}
