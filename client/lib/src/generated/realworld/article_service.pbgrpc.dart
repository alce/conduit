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
  static final _$list =
      $grpc.ClientMethod<$0.ListArticlesRequest, $0.ArticleList>(
          '/realworld.ArticleService/List',
          ($0.ListArticlesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ArticleList.fromBuffer(value));
  static final _$getFeed =
      $grpc.ClientMethod<$0.GetFeedRequest, $0.ArticleList>(
          '/realworld.ArticleService/GetFeed',
          ($0.GetFeedRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ArticleList.fromBuffer(value));
  static final _$get = $grpc.ClientMethod<$0.GetArticleRequest, $0.Article>(
      '/realworld.ArticleService/Get',
      ($0.GetArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$create =
      $grpc.ClientMethod<$0.CreateArticleRequest, $0.Article>(
          '/realworld.ArticleService/Create',
          ($0.CreateArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$update =
      $grpc.ClientMethod<$0.UpdateArticleRequest, $0.Article>(
          '/realworld.ArticleService/Update',
          ($0.UpdateArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$0.DeleteArticleRequest, $1.Empty>(
      '/realworld.ArticleService/Delete',
      ($0.DeleteArticleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
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
  static final _$deleteComment =
      $grpc.ClientMethod<$0.DeleteCommentRequest, $1.Empty>(
          '/realworld.ArticleService/DeleteComment',
          ($0.DeleteCommentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$favoriteArticle =
      $grpc.ClientMethod<$0.FavoriteArticleRequest, $0.Article>(
          '/realworld.ArticleService/FavoriteArticle',
          ($0.FavoriteArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$unFavoriteArticle =
      $grpc.ClientMethod<$0.FavoriteArticleRequest, $0.Article>(
          '/realworld.ArticleService/UnFavoriteArticle',
          ($0.FavoriteArticleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Article.fromBuffer(value));
  static final _$listTags = $grpc.ClientMethod<$0.ListTagsRequest, $0.TagList>(
      '/realworld.ArticleService/ListTags',
      ($0.ListTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TagList.fromBuffer(value));

  ArticleServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ArticleList> list($0.ListArticlesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.ArticleList> getFeed($0.GetFeedRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFeed, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> get($0.GetArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> create($0.CreateArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> update($0.UpdateArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> delete($0.DeleteArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
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

  $grpc.ResponseFuture<$1.Empty> deleteComment($0.DeleteCommentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> favoriteArticle(
      $0.FavoriteArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$favoriteArticle, request, options: options);
  }

  $grpc.ResponseFuture<$0.Article> unFavoriteArticle(
      $0.FavoriteArticleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unFavoriteArticle, request, options: options);
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
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListArticlesRequest.fromBuffer(value),
        ($0.ArticleList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFeedRequest, $0.ArticleList>(
        'GetFeed',
        getFeed_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetFeedRequest.fromBuffer(value),
        ($0.ArticleList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetArticleRequest, $0.Article>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateArticleRequest, $0.Article>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateArticleRequest, $0.Article>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteArticleRequest, $1.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteArticleRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.DeleteCommentRequest, $1.Empty>(
        'DeleteComment',
        deleteComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteCommentRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FavoriteArticleRequest, $0.Article>(
        'FavoriteArticle',
        favoriteArticle_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FavoriteArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FavoriteArticleRequest, $0.Article>(
        'UnFavoriteArticle',
        unFavoriteArticle_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FavoriteArticleRequest.fromBuffer(value),
        ($0.Article value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTagsRequest, $0.TagList>(
        'ListTags',
        listTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTagsRequest.fromBuffer(value),
        ($0.TagList value) => value.writeToBuffer()));
  }

  $async.Future<$0.ArticleList> list_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListArticlesRequest> request) async {
    return list(call, await request);
  }

  $async.Future<$0.ArticleList> getFeed_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetFeedRequest> request) async {
    return getFeed(call, await request);
  }

  $async.Future<$0.Article> get_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetArticleRequest> request) async {
    return get(call, await request);
  }

  $async.Future<$0.Article> create_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateArticleRequest> request) async {
    return create(call, await request);
  }

  $async.Future<$0.Article> update_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateArticleRequest> request) async {
    return update(call, await request);
  }

  $async.Future<$1.Empty> delete_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteArticleRequest> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.Comment> createComment_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateCommentRequest> request) async {
    return createComment(call, await request);
  }

  $async.Future<$0.CommentList> listComments_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListCommentsRequest> request) async {
    return listComments(call, await request);
  }

  $async.Future<$1.Empty> deleteComment_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteCommentRequest> request) async {
    return deleteComment(call, await request);
  }

  $async.Future<$0.Article> favoriteArticle_Pre($grpc.ServiceCall call,
      $async.Future<$0.FavoriteArticleRequest> request) async {
    return favoriteArticle(call, await request);
  }

  $async.Future<$0.Article> unFavoriteArticle_Pre($grpc.ServiceCall call,
      $async.Future<$0.FavoriteArticleRequest> request) async {
    return unFavoriteArticle(call, await request);
  }

  $async.Future<$0.TagList> listTags_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListTagsRequest> request) async {
    return listTags(call, await request);
  }

  $async.Future<$0.ArticleList> list(
      $grpc.ServiceCall call, $0.ListArticlesRequest request);
  $async.Future<$0.ArticleList> getFeed(
      $grpc.ServiceCall call, $0.GetFeedRequest request);
  $async.Future<$0.Article> get(
      $grpc.ServiceCall call, $0.GetArticleRequest request);
  $async.Future<$0.Article> create(
      $grpc.ServiceCall call, $0.CreateArticleRequest request);
  $async.Future<$0.Article> update(
      $grpc.ServiceCall call, $0.UpdateArticleRequest request);
  $async.Future<$1.Empty> delete(
      $grpc.ServiceCall call, $0.DeleteArticleRequest request);
  $async.Future<$0.Comment> createComment(
      $grpc.ServiceCall call, $0.CreateCommentRequest request);
  $async.Future<$0.CommentList> listComments(
      $grpc.ServiceCall call, $0.ListCommentsRequest request);
  $async.Future<$1.Empty> deleteComment(
      $grpc.ServiceCall call, $0.DeleteCommentRequest request);
  $async.Future<$0.Article> favoriteArticle(
      $grpc.ServiceCall call, $0.FavoriteArticleRequest request);
  $async.Future<$0.Article> unFavoriteArticle(
      $grpc.ServiceCall call, $0.FavoriteArticleRequest request);
  $async.Future<$0.TagList> listTags(
      $grpc.ServiceCall call, $0.ListTagsRequest request);
}
