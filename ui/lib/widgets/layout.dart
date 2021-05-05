import 'package:flutter/material.dart';

import '../theme.dart';
import 'nav_bar.dart';

enum LayoutWidth { wide, narrow }

const narrowLayoutWidth = maxLayoutWidth - 300; // ..ish

class Layout extends StatelessWidget {
  const Layout({
    required this.body,
    this.width = LayoutWidth.wide,
    this.banner,
  });

  final Widget body;
  final Widget? banner;
  final LayoutWidth width;

  @override
  Widget build(BuildContext cx) {
    final maxWidth =
        width == LayoutWidth.wide ? maxLayoutWidth : narrowLayoutWidth;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              NavBar(),
              banner ?? Container(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(top: 30),
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: body,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
