import 'package:grpc/grpc_connection_interface.dart';

import '../conversion.dart';
import '../generated/realworld/article_service.pbgrpc.dart' as pb;
import '../model/article.dart';
import '../model/comment.dart';

class ArticleService {
  ArticleService(ClientChannelBase channel)
      : _client = pb.ArticleServiceClient(channel);

  final pb.ArticleServiceClient _client;

  Future<ArticleList> listArticles(ArticlesFilter filter) async {
    assert(filter.page > 0, 'pagination must start at 1');
    const pageSize = 20;

    final req = pb.ListArticlesRequest(
      limit: pageSize,
      offset: pageSize * (filter.page - 1),
      filterKind: filterToProto(filter.kind),
      filterValue: filter.value,
    );

    try {
      final res = await _client.list(req);
      return ArticleList(
        res.articles.map(toArticleHead).toList(),
        totalCount: res.totalCount,
        pageSize: res.pageSize,
      );
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<ArticleList> getArticleFeed({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final req = pb.GetFeedRequest()
        ..limit = limit
        ..offset = offset;

      final res = await _client.getFeed(req);
      return ArticleList(res.articles.map(toArticleHead).toList(),
          totalCount: res.totalCount, pageSize: res.pageSize);
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<Article> getArticle(String slug) async {
    try {
      final req = pb.GetArticleRequest()..slug = slug;
      return (await _client.get(req)).article.toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<Article> createArticle({
    required String title,
    required String description,
    required String body,
    List<String> tags = const [],
    String? token,
  }) async {
    try {
      final req = pb.CreateArticleRequest()
        ..title = title
        ..description = description
        ..body = body
        ..tagList.addAll(tags);

      final proto = await _client.create(req, options: _makeOptions(token));
      return proto.article.toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<Article> updateArticle({
    required String slug,
    String? title,
    String? description,
    String? body,
    String? token,
  }) async {
    try {
      final req = pb.UpdateArticleRequest(
        slug: slug,
        title: title,
        description: description,
        body: body,
      );

      final proto = await _client.update(req, options: _makeOptions(token));
      return proto.article.toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<void> deleteArticle(String slug) async {
    try {
      final req = pb.DeleteArticleRequest()..slug = slug;
      await _client.delete(req);
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<Article> favoriteArticle(String slug) async {
    try {
      final req = pb.FavoriteArticleRequest()..slug = slug;
      return (await _client.favoriteArticle(req)).article.toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<Article> unfavoriteArticle(String slug) async {
    try {
      final req = pb.FavoriteArticleRequest()..slug = slug;
      return (await _client.unfavoriteArticle(req)).article.toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<Comment> createComment(String articleSlug, String body) async {
    try {
      final req = pb.CreateCommentRequest()
        ..slug = articleSlug
        ..body = body;

      return (await _client.createComment(req)).comment.toModel();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<List<Comment>> listComments(String slug) async {
    try {
      final req = pb.ListCommentsRequest()..slug = slug;
      final res = await _client.listComments(req);
      return res.comments.map(toComment).toList();
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  Future<List<String>> listTags() async {
    try {
      return (await _client.listTags(pb.ListTagsRequest())).tags;
    } on GrpcError catch (e) {
      throw e.toConduitException();
    }
  }

  CallOptions? _makeOptions(String? token) {
    if (token == null) {
      return null;
    } else {
      return CallOptions(metadata: <String, String>{
        'x-auth-token': token,
      });
    }
  }
}
