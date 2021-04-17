///
//  Generated code. Do not modify.
//  source: realworld/article_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'article_service.pb.dart' as $0;
import '../google/protobuf/empty.pb.dart' as $1;
export 'article_service.pb.dart';

class ArticleServiceClient extends $grpc.Client {
  static final _$listArticles =
      $grpc.ClientMethod<$0.ListArticlesRequest, $0.ArticleList>(
          '/realworld.ArticleService/ListArticles',
          ($0.ListArticlesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ArticleList.fromBuffer(value));
  static final _$getArticleFeed =
      $grpc.ClientMethod<$0.GetArticleFeedRequest, $0.ArticleList>(
          '/realworld.ArticleService/GetArticleFeed',
          ($0.GetArticleFeedRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ArticleList.fromBuffer(value));
  static final _$getArticle =
      $grpc.ClientMethod<$0.GetArticleRequest, $0.Article>(
          '/realworld.ArticleService/GetArticle',
          ($0.GetArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$createArticle =
      $grpc.ClientMethod<$0.CreateArticleRequest, $0.Article>(
          '/realworld.ArticleService/CreateArticle',
          ($0.CreateArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$updateArticle =
      $grpc.ClientMethod<$0.UpdateArticleRequest, $0.Article>(
          '/realworld.ArticleService/UpdateArticle',
          ($0.UpdateArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$deleteArticle =
      $grpc.ClientMethod<$0.DeleteArticleRequest, $1.Empty>(
          '/realworld.ArticleService/DeleteArticle',
          ($0.DeleteArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$toggleFavoriteArticle =
      $grpc.ClientMethod<$0.ToggleFavoriteArticleRequest, $0.Article>(
          '/realworld.ArticleService/ToggleFavoriteArticle',
          ($0.ToggleFavoriteArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$createComment =
      $grpc.ClientMethod<$0.CreateCommentRequest, $0.Comment>(
          '/realworld.ArticleService/CreateComment',
          ($0.CreateCommentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Comment.fromBuffer(value));
  static final _$listComments =
      $grpc.ClientMethod<$0.ListCommentsRequest, $0.CommentList>(
          '/realworld.ArticleService/ListComments',
          ($0.ListCommentsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CommentList.fromBuffer(value));
  static final _$listTags = $grpc.ClientMethod<$0.ListTagsRequest, $0.TagList>(
      '/realworld.ArticleService/ListTags',
      ($0.ListTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TagList.fromBuffer(value));

  ArticleServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ArticleList> listArticles(
      $0.ListArticlesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listArticles, request, options: options);
  }

  $grpc.ResponseFuture<$0.ArticleList> getArticleFeed(
      $0.GetArticleFeedRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getArticleFeed, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> getArticle($0.GetArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getArticle, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> createArticle(
      $0.CreateArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createArticle, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> updateArticle(
      $0.UpdateArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateArticle, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteArticle($0.DeleteArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteArticle, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> toggleFavoriteArticle(
      $0.ToggleFavoriteArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$toggleFavoriteArticle, request, options: options);
  }

  $grpc.ResponseFuture<$0.Comment> createComment(
      $0.CreateCommentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.CommentList> listComments(
      $0.ListCommentsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listComments, request, options: options);
  }

  $grpc.ResponseFuture<$0.TagList> listTags($0.ListTagsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTags, request, options: options);
  }
}

abstract class ArticleServiceBase extends $grpc.Service {
  $core.String get $name => 'realworld.ArticleService';

  ArticleServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListArticlesRequest, $0.ArticleList>(
        'ListArticles',
        listArticles_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListArticlesRequest.fromBuffer(value),
        ($0.ArticleList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetArticleFeedRequest, $0.ArticleList>(
        'GetArticleFeed',
        getArticleFeed_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetArticleFeedRequest.fromBuffer(value),
        ($0.ArticleList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetArticleRequest, $0.Article>(
        'GetArticle',
        getArticle_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateArticleRequest, $0.Article>(
        'CreateArticle',
        createArticle_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateArticleRequest, $0.Article>(
        'UpdateArticle',
        updateArticle_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteArticleRequest, $1.Empty>(
        'DeleteArticle',
        deleteArticle_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteArticleRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ToggleFavoriteArticleRequest, $0.Article>(
        'ToggleFavoriteArticle',
        toggleFavoriteArticle_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ToggleFavoriteArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateCommentRequest, $0.Comment>(
        'CreateComment',
        createComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateCommentRequest.fromBuffer(value),
        ($0.Comment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListCommentsRequest, $0.CommentList>(
        'ListComments',
        listComments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListCommentsRequest.fromBuffer(value),
        ($0.CommentList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTagsRequest, $0.TagList>(
        'ListTags',
        listTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTagsRequest.fromBuffer(value),
        ($0.TagList value) => value.writeToBuffer()));
  }

  $async.Future<$0.ArticleList> listArticles_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListArticlesRequest> request) async {
    return listArticles(call, await request);
  }

  $async.Future<$0.ArticleList> getArticleFeed_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetArticleFeedRequest> request) async {
    return getArticleFeed(call, await request);
  }

  $async.Future<$0.Article> getArticle_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetArticleRequest> request) async {
    return getArticle(call, await request);
  }

  $async.Future<$0.Article> createArticle_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateArticleRequest> request) async {
    return createArticle(call, await request);
  }

  $async.Future<$0.Article> updateArticle_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateArticleRequest> request) async {
    return updateArticle(call, await request);
  }

  $async.Future<$1.Empty> deleteArticle_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteArticleRequest> request) async {
    return deleteArticle(call, await request);
  }

  $async.Future<$0.Article> toggleFavoriteArticle_Pre($grpc.ServiceCall call,
      $async.Future<$0.ToggleFavoriteArticleRequest> request) async {
    return toggleFavoriteArticle(call, await request);
  }

  $async.Future<$0.Comment> createComment_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateCommentRequest> request) async {
    return createComment(call, await request);
  }

  $async.Future<$0.CommentList> listComments_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListCommentsRequest> request) async {
    return listComments(call, await request);
  }

  $async.Future<$0.TagList> listTags_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListTagsRequest> request) async {
    return listTags(call, await request);
  }

  $async.Future<$0.ArticleList> listArticles(
      $grpc.ServiceCall call, $0.ListArticlesRequest request);
  $async.Future<$0.ArticleList> getArticleFeed(
      $grpc.ServiceCall call, $0.GetArticleFeedRequest request);
  $async.Future<$0.Article> getArticle(
      $grpc.ServiceCall call, $0.GetArticleRequest request);
  $async.Future<$0.Article> createArticle(
      $grpc.ServiceCall call, $0.CreateArticleRequest request);
  $async.Future<$0.Article> updateArticle(
      $grpc.ServiceCall call, $0.UpdateArticleRequest request);
  $async.Future<$1.Empty> deleteArticle(
      $grpc.ServiceCall call, $0.DeleteArticleRequest request);
  $async.Future<$0.Article> toggleFavoriteArticle(
      $grpc.ServiceCall call, $0.ToggleFavoriteArticleRequest request);
  $async.Future<$0.Comment> createComment(
      $grpc.ServiceCall call, $0.CreateCommentRequest request);
  $async.Future<$0.CommentList> listComments(
      $grpc.ServiceCall call, $0.ListCommentsRequest request);
  $async.Future<$0.TagList> listTags(
      $grpc.ServiceCall call, $0.ListTagsRequest request);
}
