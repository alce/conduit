import 'package:grpc/grpc_connection_interface.dart';

import '../conversion.dart';
import '../generated/realworld/article_service.pbgrpc.dart' as pb;
import '../model/article.dart';
import '../model/comment.dart';
import '../model/resource_list.dart';

class ArticleService {
  ArticleService(ClientChannelBase channel)
      : _client = pb.ArticleServiceClient(channel);

  final pb.ArticleServiceClient _client;

  Future<ResourceList<Article>> listArticles({
    int limit = 20,
    int offset = 0,
  }) async {
    final req = pb.ListArticlesRequest()
      ..limit = limit
      ..offset = offset;

    final list = await _client.listArticles(req);
    return ResourceList(list.articles.map(toArticle).toList());
  }

  Future<ResourceList<Article>> getArticleFeed({
    int limit = 20,
    int offset = 0,
  }) async {
    final req = pb.GetArticleFeedRequest()
      ..limit = limit
      ..offset = offset;

    final list = await _client.getArticleFeed(req);
    return ResourceList(list.articles.map(toArticle).toList());
  }

  Future<Article> getArticle(String slug) async {
    final req = pb.GetArticleRequest()..slug = slug;
    final proto = await _client.getArticle(req);
    return proto.toModel();
  }

  Future<Article> createArticle({
    required String title,
    required String description,
    required String body,
    List<String> tags = const [],
  }) async {
    final article = pb.Article()
      ..title = title
      ..description = description
      ..body = body
      ..tagList.addAll(tags);

    final req = pb.CreateArticleRequest()..article = article;
    final proto = await _client.createArticle(req);
    return proto.toModel();
  }

  Future<Article> updateArticle({
    required String title,
    required String description,
    required String body,
    List<String> tags = const [],
  }) async {
    final article = pb.Article()
      ..title = title
      ..description = description
      ..body = body
      ..tagList.addAll(tags);

    final req = pb.UpdateArticleRequest()..article = article;
    final proto = await _client.updateArticle(req);
    return proto.toModel();
  }

  Future<void> deleteArticle(String slug) async {
    final req = pb.DeleteArticleRequest()..slug = slug;
    await _client.deleteArticle(req);
  }

  Future<Article> favoriteArticle(String slug) async =>
      _toggleFavoriteArticle(slug);

  Future<Article> unFavoriteArticle(String slug) async =>
      _toggleFavoriteArticle(slug);

  Future<Article> _toggleFavoriteArticle(String slug) async {
    final req = pb.ToggleFavoriteArticleRequest()..slug = slug;
    final proto = await _client.toggleFavoriteArticle(req);
    return proto.toModel();
  }

  Future<Comment> createComment(String articleSlug, String body) async {
    final req = pb.CreateCommentRequest()
      ..slug = articleSlug
      ..body = body;

    final proto = await _client.createComment(req);
    return proto.toModel();
  }

  Future<ResourceList<Comment>> listComments(String slug) async {
    final req = pb.ListCommentsRequest()..slug = slug;
    final list = await _client.listComments(req);
    return ResourceList(list.comments.map(toComment).toList());
  }

  Future<ResourceList<String>> listTags() async {
    final list = await _client.listTags(pb.ListTagsRequest());
    return ResourceList(list.tags);
  }
}
