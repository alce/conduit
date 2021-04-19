///
//  Generated code. Do not modify.
//  source: realworld/article_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use articleDescriptor instead')
const Article$json = const {
  '1': 'Article',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '10': 'slug'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'tag_list', '3': 5, '4': 3, '5': 9, '10': 'tagList'},
    const {'1': 'favorited', '3': 6, '4': 1, '5': 8, '10': 'favorited'},
    const {'1': 'create_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createTime'},
    const {'1': 'update_time', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updateTime'},
    const {'1': 'favorites_count', '3': 9, '4': 1, '5': 5, '10': 'favoritesCount'},
    const {'1': 'author', '3': 10, '4': 1, '5': 11, '6': '.realworld.Profile', '10': 'author'},
  ],
};

/// Descriptor for `Article`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleDescriptor = $convert.base64Decode('CgdBcnRpY2xlEhIKBHNsdWcYASABKAlSBHNsdWcSFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhISCgRib2R5GAQgASgJUgRib2R5EhkKCHRhZ19saXN0GAUgAygJUgd0YWdMaXN0EhwKCWZhdm9yaXRlZBgGIAEoCFIJZmF2b3JpdGVkEjsKC2NyZWF0ZV90aW1lGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKY3JlYXRlVGltZRI7Cgt1cGRhdGVfdGltZRgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCnVwZGF0ZVRpbWUSJwoPZmF2b3JpdGVzX2NvdW50GAkgASgFUg5mYXZvcml0ZXNDb3VudBIqCgZhdXRob3IYCiABKAsyEi5yZWFsd29ybGQuUHJvZmlsZVIGYXV0aG9y');
@$core.Deprecated('Use articleArgsDescriptor instead')
const ArticleArgs$json = const {
  '1': 'ArticleArgs',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'description'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'body'},
    const {'1': 'tag_list', '3': 4, '4': 3, '5': 9, '10': 'tagList'},
  ],
};

/// Descriptor for `ArticleArgs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleArgsDescriptor = $convert.base64Decode('CgtBcnRpY2xlQXJncxIZCgV0aXRsZRgBIAEoCUID4EECUgV0aXRsZRIlCgtkZXNjcmlwdGlvbhgCIAEoCUID4EECUgtkZXNjcmlwdGlvbhIXCgRib2R5GAMgASgJQgPgQQJSBGJvZHkSGQoIdGFnX2xpc3QYBCADKAlSB3RhZ0xpc3Q=');
@$core.Deprecated('Use commentDescriptor instead')
const Comment$json = const {
  '1': 'Comment',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'create_time', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createTime'},
    const {'1': 'update_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updateTime'},
    const {'1': 'author', '3': 5, '4': 1, '5': 11, '6': '.realworld.Profile', '10': 'author'},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode('CgdDb21tZW50Eg4KAmlkGAEgASgJUgJpZBISCgRib2R5GAIgASgJUgRib2R5EjsKC2NyZWF0ZV90aW1lGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKY3JlYXRlVGltZRI7Cgt1cGRhdGVfdGltZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCnVwZGF0ZVRpbWUSKgoGYXV0aG9yGAUgASgLMhIucmVhbHdvcmxkLlByb2ZpbGVSBmF1dGhvcg==');
@$core.Deprecated('Use listArticlesRequestDescriptor instead')
const ListArticlesRequest$json = const {
  '1': 'ListArticlesRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ListArticlesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listArticlesRequestDescriptor = $convert.base64Decode('ChNMaXN0QXJ0aWNsZXNSZXF1ZXN0EhQKBWxpbWl0GAEgASgFUgVsaW1pdBIWCgZvZmZzZXQYAiABKAVSBm9mZnNldA==');
@$core.Deprecated('Use getFeedRequestDescriptor instead')
const GetFeedRequest$json = const {
  '1': 'GetFeedRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetFeedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFeedRequestDescriptor = $convert.base64Decode('Cg5HZXRGZWVkUmVxdWVzdBIUCgVsaW1pdBgBIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAIgASgFUgZvZmZzZXQ=');
@$core.Deprecated('Use articleListDescriptor instead')
const ArticleList$json = const {
  '1': 'ArticleList',
  '2': const [
    const {'1': 'articles', '3': 1, '4': 3, '5': 11, '6': '.realworld.Article', '10': 'articles'},
    const {'1': 'article_count', '3': 2, '4': 1, '5': 5, '10': 'articleCount'},
  ],
};

/// Descriptor for `ArticleList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleListDescriptor = $convert.base64Decode('CgtBcnRpY2xlTGlzdBIuCghhcnRpY2xlcxgBIAMoCzISLnJlYWx3b3JsZC5BcnRpY2xlUghhcnRpY2xlcxIjCg1hcnRpY2xlX2NvdW50GAIgASgFUgxhcnRpY2xlQ291bnQ=');
@$core.Deprecated('Use createArticleRequestDescriptor instead')
const CreateArticleRequest$json = const {
  '1': 'CreateArticleRequest',
  '2': const [
    const {'1': 'article', '3': 1, '4': 1, '5': 11, '6': '.realworld.ArticleArgs', '8': const {}, '10': 'article'},
  ],
};

/// Descriptor for `CreateArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createArticleRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVBcnRpY2xlUmVxdWVzdBI1CgdhcnRpY2xlGAEgASgLMhYucmVhbHdvcmxkLkFydGljbGVBcmdzQgPgQQJSB2FydGljbGU=');
@$core.Deprecated('Use deleteArticleRequestDescriptor instead')
const DeleteArticleRequest$json = const {
  '1': 'DeleteArticleRequest',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'slug'},
  ],
};

/// Descriptor for `DeleteArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteArticleRequestDescriptor = $convert.base64Decode('ChREZWxldGVBcnRpY2xlUmVxdWVzdBIXCgRzbHVnGAEgASgJQgPgQQJSBHNsdWc=');
@$core.Deprecated('Use getArticleRequestDescriptor instead')
const GetArticleRequest$json = const {
  '1': 'GetArticleRequest',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'slug'},
  ],
};

/// Descriptor for `GetArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getArticleRequestDescriptor = $convert.base64Decode('ChFHZXRBcnRpY2xlUmVxdWVzdBIXCgRzbHVnGAEgASgJQgPgQQJSBHNsdWc=');
@$core.Deprecated('Use updateArticleRequestDescriptor instead')
const UpdateArticleRequest$json = const {
  '1': 'UpdateArticleRequest',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'slug'},
    const {'1': 'article', '3': 2, '4': 1, '5': 11, '6': '.realworld.ArticleArgs', '8': const {}, '10': 'article'},
  ],
};

/// Descriptor for `UpdateArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateArticleRequestDescriptor = $convert.base64Decode('ChRVcGRhdGVBcnRpY2xlUmVxdWVzdBIXCgRzbHVnGAEgASgJQgPgQQJSBHNsdWcSNQoHYXJ0aWNsZRgCIAEoCzIWLnJlYWx3b3JsZC5BcnRpY2xlQXJnc0ID4EECUgdhcnRpY2xl');
@$core.Deprecated('Use favoriteArticleRequestDescriptor instead')
const FavoriteArticleRequest$json = const {
  '1': 'FavoriteArticleRequest',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'slug'},
  ],
};

/// Descriptor for `FavoriteArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteArticleRequestDescriptor = $convert.base64Decode('ChZGYXZvcml0ZUFydGljbGVSZXF1ZXN0EhcKBHNsdWcYASABKAlCA+BBAlIEc2x1Zw==');
@$core.Deprecated('Use listCommentsRequestDescriptor instead')
const ListCommentsRequest$json = const {
  '1': 'ListCommentsRequest',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'slug'},
  ],
};

/// Descriptor for `ListCommentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCommentsRequestDescriptor = $convert.base64Decode('ChNMaXN0Q29tbWVudHNSZXF1ZXN0EhcKBHNsdWcYASABKAlCA+BBAlIEc2x1Zw==');
@$core.Deprecated('Use commentListDescriptor instead')
const CommentList$json = const {
  '1': 'CommentList',
  '2': const [
    const {'1': 'comments', '3': 1, '4': 3, '5': 11, '6': '.realworld.Comment', '10': 'comments'},
  ],
};

/// Descriptor for `CommentList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentListDescriptor = $convert.base64Decode('CgtDb21tZW50TGlzdBIuCghjb21tZW50cxgBIAMoCzISLnJlYWx3b3JsZC5Db21tZW50Ughjb21tZW50cw==');
@$core.Deprecated('Use createCommentRequestDescriptor instead')
const CreateCommentRequest$json = const {
  '1': 'CreateCommentRequest',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'slug'},
    const {'1': 'body', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'body'},
  ],
};

/// Descriptor for `CreateCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCommentRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVDb21tZW50UmVxdWVzdBIXCgRzbHVnGAEgASgJQgPgQQJSBHNsdWcSFwoEYm9keRgCIAEoCUID4EECUgRib2R5');
@$core.Deprecated('Use deleteCommentRequestDescriptor instead')
const DeleteCommentRequest$json = const {
  '1': 'DeleteCommentRequest',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'slug'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'id'},
  ],
};

/// Descriptor for `DeleteCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentRequestDescriptor = $convert.base64Decode('ChREZWxldGVDb21tZW50UmVxdWVzdBIXCgRzbHVnGAEgASgJQgPgQQJSBHNsdWcSEwoCaWQYAiABKAlCA+BBAlICaWQ=');
@$core.Deprecated('Use listTagsRequestDescriptor instead')
const ListTagsRequest$json = const {
  '1': 'ListTagsRequest',
};

/// Descriptor for `ListTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTagsRequestDescriptor = $convert.base64Decode('Cg9MaXN0VGFnc1JlcXVlc3Q=');
@$core.Deprecated('Use tagListDescriptor instead')
const TagList$json = const {
  '1': 'TagList',
  '2': const [
    const {'1': 'tags', '3': 1, '4': 3, '5': 9, '10': 'tags'},
  ],
};

/// Descriptor for `TagList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagListDescriptor = $convert.base64Decode('CgdUYWdMaXN0EhIKBHRhZ3MYASADKAlSBHRhZ3M=');
