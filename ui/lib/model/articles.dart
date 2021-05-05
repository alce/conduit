import 'package:conduit_client/conduit_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class ArticlesState {}

class ArticlesModel extends ChangeNotifier {
  ArticlesModel(this._client, this._read);

  final Reader _read;

  final ConduitClient _client;

  List<ArticleHead> _articles = [];
  List<ArticleHead> get articles => _articles;

  int _pageSize = 20;
  int get pageSize => _pageSize;

  int _totalCount = 0;
  int get totalCount => _totalCount;

  int get pageCount {
    return (_totalCount / _pageSize).round();
  }

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  Future<void> listArticles() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final res =
          await _client.articles.listArticles(_read(articlesFilterProvider));
      _pageSize = res.pageSize;
      _totalCount = res.totalCount;
      _articles = res.articles;
    } on ConduitException catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> favoriteArticle(String slug) async {
    try {
      final updated = await _client.articles.favoriteArticle(slug);
      _articles = [
        for (final article in _articles)
          if (article.slug == updated.slug) updated.head() else article
      ];
      notifyListeners();
    } on ConduitException catch (_) {
      // TODO
      rethrow;
    }
  }
}
