///
//  Generated code. Do not modify.
//  source: realworld/article_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $4;
import 'common.pb.dart' as $3;

class Article extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Article', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..pPS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagList')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorited')
    ..aOM<$4.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', subBuilder: $4.Timestamp.create)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favoritesCount', $pb.PbFieldType.O3)
    ..aOM<$3.Profile>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'author', subBuilder: $3.Profile.create)
    ..hasRequiredFields = false
  ;

  Article._() : super();
  factory Article({
    $core.String? slug,
    $core.String? title,
    $core.String? description,
    $core.String? body,
    $core.Iterable<$core.String>? tagList,
    $core.bool? favorited,
    $4.Timestamp? createTime,
    $4.Timestamp? updateTime,
    $core.int? favoritesCount,
    $3.Profile? author,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (body != null) {
      _result.body = body;
    }
    if (tagList != null) {
      _result.tagList.addAll(tagList);
    }
    if (favorited != null) {
      _result.favorited = favorited;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (favoritesCount != null) {
      _result.favoritesCount = favoritesCount;
    }
    if (author != null) {
      _result.author = author;
    }
    return _result;
  }
  factory Article.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Article.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Article clone() => Article()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Article copyWith(void Function(Article) updates) => super.copyWith((message) => updates(message as Article)) as Article; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Article create() => Article._();
  Article createEmptyInstance() => create();
  static $pb.PbList<Article> createRepeated() => $pb.PbList<Article>();
  @$core.pragma('dart2js:noInline')
  static Article getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Article>(create);
  static Article? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get body => $_getSZ(3);
  @$pb.TagNumber(4)
  set body($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get tagList => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get favorited => $_getBF(5);
  @$pb.TagNumber(6)
  set favorited($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorited() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorited() => clearField(6);

  @$pb.TagNumber(7)
  $4.Timestamp get createTime => $_getN(6);
  @$pb.TagNumber(7)
  set createTime($4.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTime() => clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensureCreateTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $4.Timestamp get updateTime => $_getN(7);
  @$pb.TagNumber(8)
  set updateTime($4.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateTime() => clearField(8);
  @$pb.TagNumber(8)
  $4.Timestamp ensureUpdateTime() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.int get favoritesCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set favoritesCount($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFavoritesCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearFavoritesCount() => clearField(9);

  @$pb.TagNumber(10)
  $3.Profile get author => $_getN(9);
  @$pb.TagNumber(10)
  set author($3.Profile v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAuthor() => $_has(9);
  @$pb.TagNumber(10)
  void clearAuthor() => clearField(10);
  @$pb.TagNumber(10)
  $3.Profile ensureAuthor() => $_ensure(9);
}

class ArticleArgs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ArticleArgs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagList')
    ..hasRequiredFields = false
  ;

  ArticleArgs._() : super();
  factory ArticleArgs({
    $core.String? title,
    $core.String? description,
    $core.String? body,
    $core.Iterable<$core.String>? tagList,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (body != null) {
      _result.body = body;
    }
    if (tagList != null) {
      _result.tagList.addAll(tagList);
    }
    return _result;
  }
  factory ArticleArgs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticleArgs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticleArgs clone() => ArticleArgs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticleArgs copyWith(void Function(ArticleArgs) updates) => super.copyWith((message) => updates(message as ArticleArgs)) as ArticleArgs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArticleArgs create() => ArticleArgs._();
  ArticleArgs createEmptyInstance() => create();
  static $pb.PbList<ArticleArgs> createRepeated() => $pb.PbList<ArticleArgs>();
  @$core.pragma('dart2js:noInline')
  static ArticleArgs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticleArgs>(create);
  static ArticleArgs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get tagList => $_getList(3);
}

class Comment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Comment', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..aOM<$4.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', subBuilder: $4.Timestamp.create)
    ..aOM<$3.Profile>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'author', subBuilder: $3.Profile.create)
    ..hasRequiredFields = false
  ;

  Comment._() : super();
  factory Comment({
    $core.String? id,
    $core.String? body,
    $4.Timestamp? createTime,
    $4.Timestamp? updateTime,
    $3.Profile? author,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (body != null) {
      _result.body = body;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (author != null) {
      _result.author = author;
    }
    return _result;
  }
  factory Comment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Comment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Comment clone() => Comment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Comment copyWith(void Function(Comment) updates) => super.copyWith((message) => updates(message as Comment)) as Comment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Comment create() => Comment._();
  Comment createEmptyInstance() => create();
  static $pb.PbList<Comment> createRepeated() => $pb.PbList<Comment>();
  @$core.pragma('dart2js:noInline')
  static Comment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Comment>(create);
  static Comment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get body => $_getSZ(1);
  @$pb.TagNumber(2)
  set body($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);

  @$pb.TagNumber(3)
  $4.Timestamp get createTime => $_getN(2);
  @$pb.TagNumber(3)
  set createTime($4.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateTime() => clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureCreateTime() => $_ensure(2);

  @$pb.TagNumber(4)
  $4.Timestamp get updateTime => $_getN(3);
  @$pb.TagNumber(4)
  set updateTime($4.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateTime() => clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureUpdateTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $3.Profile get author => $_getN(4);
  @$pb.TagNumber(5)
  set author($3.Profile v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthor() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthor() => clearField(5);
  @$pb.TagNumber(5)
  $3.Profile ensureAuthor() => $_ensure(4);
}

class ListArticlesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListArticlesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ListArticlesRequest._() : super();
  factory ListArticlesRequest({
    $core.int? limit,
    $core.int? offset,
  }) {
    final _result = create();
    if (limit != null) {
      _result.limit = limit;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    return _result;
  }
  factory ListArticlesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListArticlesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListArticlesRequest clone() => ListArticlesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListArticlesRequest copyWith(void Function(ListArticlesRequest) updates) => super.copyWith((message) => updates(message as ListArticlesRequest)) as ListArticlesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListArticlesRequest create() => ListArticlesRequest._();
  ListArticlesRequest createEmptyInstance() => create();
  static $pb.PbList<ListArticlesRequest> createRepeated() => $pb.PbList<ListArticlesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListArticlesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListArticlesRequest>(create);
  static ListArticlesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);
}

class GetFeedRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFeedRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetFeedRequest._() : super();
  factory GetFeedRequest({
    $core.int? limit,
    $core.int? offset,
  }) {
    final _result = create();
    if (limit != null) {
      _result.limit = limit;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    return _result;
  }
  factory GetFeedRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFeedRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFeedRequest clone() => GetFeedRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFeedRequest copyWith(void Function(GetFeedRequest) updates) => super.copyWith((message) => updates(message as GetFeedRequest)) as GetFeedRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFeedRequest create() => GetFeedRequest._();
  GetFeedRequest createEmptyInstance() => create();
  static $pb.PbList<GetFeedRequest> createRepeated() => $pb.PbList<GetFeedRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFeedRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFeedRequest>(create);
  static GetFeedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);
}

class ArticleList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ArticleList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..pc<Article>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'articles', $pb.PbFieldType.PM, subBuilder: Article.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'articleCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ArticleList._() : super();
  factory ArticleList({
    $core.Iterable<Article>? articles,
    $core.int? articleCount,
  }) {
    final _result = create();
    if (articles != null) {
      _result.articles.addAll(articles);
    }
    if (articleCount != null) {
      _result.articleCount = articleCount;
    }
    return _result;
  }
  factory ArticleList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticleList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticleList clone() => ArticleList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticleList copyWith(void Function(ArticleList) updates) => super.copyWith((message) => updates(message as ArticleList)) as ArticleList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArticleList create() => ArticleList._();
  ArticleList createEmptyInstance() => create();
  static $pb.PbList<ArticleList> createRepeated() => $pb.PbList<ArticleList>();
  @$core.pragma('dart2js:noInline')
  static ArticleList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticleList>(create);
  static ArticleList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Article> get articles => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get articleCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set articleCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasArticleCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearArticleCount() => clearField(2);
}

class CreateArticleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateArticleRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOM<ArticleArgs>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'article', subBuilder: ArticleArgs.create)
    ..hasRequiredFields = false
  ;

  CreateArticleRequest._() : super();
  factory CreateArticleRequest({
    ArticleArgs? article,
  }) {
    final _result = create();
    if (article != null) {
      _result.article = article;
    }
    return _result;
  }
  factory CreateArticleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateArticleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateArticleRequest clone() => CreateArticleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateArticleRequest copyWith(void Function(CreateArticleRequest) updates) => super.copyWith((message) => updates(message as CreateArticleRequest)) as CreateArticleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateArticleRequest create() => CreateArticleRequest._();
  CreateArticleRequest createEmptyInstance() => create();
  static $pb.PbList<CreateArticleRequest> createRepeated() => $pb.PbList<CreateArticleRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateArticleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateArticleRequest>(create);
  static CreateArticleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ArticleArgs get article => $_getN(0);
  @$pb.TagNumber(1)
  set article(ArticleArgs v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasArticle() => $_has(0);
  @$pb.TagNumber(1)
  void clearArticle() => clearField(1);
  @$pb.TagNumber(1)
  ArticleArgs ensureArticle() => $_ensure(0);
}

class DeleteArticleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteArticleRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..hasRequiredFields = false
  ;

  DeleteArticleRequest._() : super();
  factory DeleteArticleRequest({
    $core.String? slug,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    return _result;
  }
  factory DeleteArticleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteArticleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteArticleRequest clone() => DeleteArticleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteArticleRequest copyWith(void Function(DeleteArticleRequest) updates) => super.copyWith((message) => updates(message as DeleteArticleRequest)) as DeleteArticleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteArticleRequest create() => DeleteArticleRequest._();
  DeleteArticleRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteArticleRequest> createRepeated() => $pb.PbList<DeleteArticleRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteArticleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteArticleRequest>(create);
  static DeleteArticleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);
}

class GetArticleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetArticleRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..hasRequiredFields = false
  ;

  GetArticleRequest._() : super();
  factory GetArticleRequest({
    $core.String? slug,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    return _result;
  }
  factory GetArticleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetArticleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetArticleRequest clone() => GetArticleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetArticleRequest copyWith(void Function(GetArticleRequest) updates) => super.copyWith((message) => updates(message as GetArticleRequest)) as GetArticleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetArticleRequest create() => GetArticleRequest._();
  GetArticleRequest createEmptyInstance() => create();
  static $pb.PbList<GetArticleRequest> createRepeated() => $pb.PbList<GetArticleRequest>();
  @$core.pragma('dart2js:noInline')
  static GetArticleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetArticleRequest>(create);
  static GetArticleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);
}

class UpdateArticleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateArticleRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..aOM<ArticleArgs>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'article', subBuilder: ArticleArgs.create)
    ..hasRequiredFields = false
  ;

  UpdateArticleRequest._() : super();
  factory UpdateArticleRequest({
    $core.String? slug,
    ArticleArgs? article,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    if (article != null) {
      _result.article = article;
    }
    return _result;
  }
  factory UpdateArticleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateArticleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateArticleRequest clone() => UpdateArticleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateArticleRequest copyWith(void Function(UpdateArticleRequest) updates) => super.copyWith((message) => updates(message as UpdateArticleRequest)) as UpdateArticleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateArticleRequest create() => UpdateArticleRequest._();
  UpdateArticleRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateArticleRequest> createRepeated() => $pb.PbList<UpdateArticleRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateArticleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateArticleRequest>(create);
  static UpdateArticleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);

  @$pb.TagNumber(2)
  ArticleArgs get article => $_getN(1);
  @$pb.TagNumber(2)
  set article(ArticleArgs v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasArticle() => $_has(1);
  @$pb.TagNumber(2)
  void clearArticle() => clearField(2);
  @$pb.TagNumber(2)
  ArticleArgs ensureArticle() => $_ensure(1);
}

class FavoriteArticleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteArticleRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..hasRequiredFields = false
  ;

  FavoriteArticleRequest._() : super();
  factory FavoriteArticleRequest({
    $core.String? slug,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    return _result;
  }
  factory FavoriteArticleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteArticleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteArticleRequest clone() => FavoriteArticleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteArticleRequest copyWith(void Function(FavoriteArticleRequest) updates) => super.copyWith((message) => updates(message as FavoriteArticleRequest)) as FavoriteArticleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteArticleRequest create() => FavoriteArticleRequest._();
  FavoriteArticleRequest createEmptyInstance() => create();
  static $pb.PbList<FavoriteArticleRequest> createRepeated() => $pb.PbList<FavoriteArticleRequest>();
  @$core.pragma('dart2js:noInline')
  static FavoriteArticleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteArticleRequest>(create);
  static FavoriteArticleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);
}

class ListCommentsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListCommentsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..hasRequiredFields = false
  ;

  ListCommentsRequest._() : super();
  factory ListCommentsRequest({
    $core.String? slug,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    return _result;
  }
  factory ListCommentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCommentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCommentsRequest clone() => ListCommentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCommentsRequest copyWith(void Function(ListCommentsRequest) updates) => super.copyWith((message) => updates(message as ListCommentsRequest)) as ListCommentsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListCommentsRequest create() => ListCommentsRequest._();
  ListCommentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListCommentsRequest> createRepeated() => $pb.PbList<ListCommentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCommentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCommentsRequest>(create);
  static ListCommentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);
}

class CommentList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CommentList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..pc<Comment>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: Comment.create)
    ..hasRequiredFields = false
  ;

  CommentList._() : super();
  factory CommentList({
    $core.Iterable<Comment>? comments,
  }) {
    final _result = create();
    if (comments != null) {
      _result.comments.addAll(comments);
    }
    return _result;
  }
  factory CommentList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommentList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommentList clone() => CommentList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommentList copyWith(void Function(CommentList) updates) => super.copyWith((message) => updates(message as CommentList)) as CommentList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommentList create() => CommentList._();
  CommentList createEmptyInstance() => create();
  static $pb.PbList<CommentList> createRepeated() => $pb.PbList<CommentList>();
  @$core.pragma('dart2js:noInline')
  static CommentList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommentList>(create);
  static CommentList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Comment> get comments => $_getList(0);
}

class CreateCommentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateCommentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..hasRequiredFields = false
  ;

  CreateCommentRequest._() : super();
  factory CreateCommentRequest({
    $core.String? slug,
    $core.String? body,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory CreateCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCommentRequest clone() => CreateCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCommentRequest copyWith(void Function(CreateCommentRequest) updates) => super.copyWith((message) => updates(message as CreateCommentRequest)) as CreateCommentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateCommentRequest create() => CreateCommentRequest._();
  CreateCommentRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCommentRequest> createRepeated() => $pb.PbList<CreateCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCommentRequest>(create);
  static CreateCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get body => $_getSZ(1);
  @$pb.TagNumber(2)
  set body($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);
}

class DeleteCommentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteCommentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'slug')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DeleteCommentRequest._() : super();
  factory DeleteCommentRequest({
    $core.String? slug,
    $core.String? id,
  }) {
    final _result = create();
    if (slug != null) {
      _result.slug = slug;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest clone() => DeleteCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest copyWith(void Function(DeleteCommentRequest) updates) => super.copyWith((message) => updates(message as DeleteCommentRequest)) as DeleteCommentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest create() => DeleteCommentRequest._();
  DeleteCommentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentRequest> createRepeated() => $pb.PbList<DeleteCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentRequest>(create);
  static DeleteCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slug => $_getSZ(0);
  @$pb.TagNumber(1)
  set slug($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlug() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlug() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class ListTagsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTagsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListTagsRequest._() : super();
  factory ListTagsRequest() => create();
  factory ListTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTagsRequest clone() => ListTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTagsRequest copyWith(void Function(ListTagsRequest) updates) => super.copyWith((message) => updates(message as ListTagsRequest)) as ListTagsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTagsRequest create() => ListTagsRequest._();
  ListTagsRequest createEmptyInstance() => create();
  static $pb.PbList<ListTagsRequest> createRepeated() => $pb.PbList<ListTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTagsRequest>(create);
  static ListTagsRequest? _defaultInstance;
}

class TagList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TagList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'realworld'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags')
    ..hasRequiredFields = false
  ;

  TagList._() : super();
  factory TagList({
    $core.Iterable<$core.String>? tags,
  }) {
    final _result = create();
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory TagList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagList clone() => TagList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagList copyWith(void Function(TagList) updates) => super.copyWith((message) => updates(message as TagList)) as TagList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagList create() => TagList._();
  TagList createEmptyInstance() => create();
  static $pb.PbList<TagList> createRepeated() => $pb.PbList<TagList>();
  @$core.pragma('dart2js:noInline')
  static TagList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagList>(create);
  static TagList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get tags => $_getList(0);
}

