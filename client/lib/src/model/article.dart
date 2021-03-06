import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../conduit_client.dart';
import 'profile.dart';

@immutable
class ArticleHead extends Equatable {
  const ArticleHead({
    required this.slug,
    required this.title,
    required this.description,
    required this.tags,
    required this.createdAt,
    required this.favoritesCount,
    required this.authorUsername,
  });

  final String slug;
  final String title;
  final String description;
  final List<String> tags;
  final DateTime createdAt;
  final int favoritesCount;
  final String authorUsername;

  @override
  List<Object?> get props => [slug, favoritesCount];
}

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
  List<Object?> get props => [slug, favoritesCount];

  ArticleHead head() {
    return ArticleHead(
      slug: slug,
      title: title,
      description: description,
      tags: tags,
      createdAt: createdAt,
      favoritesCount: favoritesCount,
      authorUsername: author.username,
    );
  }
}

@immutable
class ArticleList {
  const ArticleList(this.articles,
      {required this.totalCount, required this.pageSize});

  final List<ArticleHead> articles;
  final int totalCount;
  final int pageSize;

  @override
  String toString() => '(count: $totalCount, size: $pageSize [$articles])';
}

enum FilterKind {
  none,
  author,
  favoritedBy,
  tag,
}

@immutable
class ArticlesFilter {
  const ArticlesFilter(this.kind, this.value, this.page);

  const ArticlesFilter.none()
      : kind = FilterKind.none,
        value = null,
        page = 1;

  final FilterKind kind;
  final String? value;
  final int page;
}
