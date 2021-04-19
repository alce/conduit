import 'package:meta/meta.dart';

import 'profile.dart';

@immutable
class Comment {
  const Comment({
    required this.id,
    required this.body,
    required this.createTime,
    required this.updateTime,
    required this.author,
  });

  final String id;
  final String body;
  final DateTime createTime;
  final DateTime updateTime;
  final Profile author;
}
