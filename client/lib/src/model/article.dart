import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'profile.dart';

@immutable
class Article extends Equatable {
  const Article({
    required this.slug,
    required this.title,
    required this.description,
    required this.body,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.favorited,
    required this.favoritesCount,
    required this.author,
  });

  final String slug;
  final String title;
  final String description;
  final String body;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool favorited;
  final int favoritesCount;
  final Profile author;

  @override
  List<Object?> get props => [slug];
}
