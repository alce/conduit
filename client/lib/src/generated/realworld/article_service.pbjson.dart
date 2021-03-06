///
//  Generated code. Do not modify.
//  source: realworld/article_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use filterKindDescriptor instead')
const FilterKind$json = const {
  '1': 'FilterKind',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'TAG', '2': 1},
    const {'1': 'AUTHOR', '2': 2},
    const {'1': 'FAVORITED_BY', '2': 3},
  ],
};

/// Descriptor for `FilterKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List filterKindDescriptor = $convert.base64Decode('CgpGaWx0ZXJLaW5kEggKBE5PTkUQABIHCgNUQUcQARIKCgZBVVRIT1IQAhIQCgxGQVZPUklURURfQlkQAw==');
@$core.Deprecated('Use articleHeadDescriptor instead')
const ArticleHead$json = const {
  '1': 'ArticleHead',
  '2': const [
    const {'1': 'slug', '3': 1, '4': 1, '5': 9, '10': 'slug'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'tag_list', '3': 4, '4': 3, '5': 9, '10': 'tagList'},
    const {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'favorites_count', '3': 9, '4': 1, '5': 5, '10': 'favoritesCount'},
    const {'1': 'author', '3': 10, '4': 1, '5': 9, '10': 'author'},
  ],
};

/// Descriptor for `ArticleHead`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleHeadDescriptor = $convert.base64Decode('CgtBcnRpY2xlSGVhZBISCgRzbHVnGAEgASgJUgRzbHVnEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGQoIdGFnX2xpc3QYBCADKAlSB3RhZ0xpc3QSOQoKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBInCg9mYXZvcml0ZXNfY291bnQYCSABKAVSDmZhdm9yaXRlc0NvdW50EhYKBmF1dGhvchgKIAEoCVIGYXV0aG9y');
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
    const {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'favorites_count', '3': 9, '4': 1, '5': 5, '10': 'favoritesCount'},
    const {'1': 'author', '3': 10, '4': 1, '5': 11, '6': '.realworld.Profile', '10': 'author'},
  ],
};

/// Descriptor for `Article`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleDescriptor = $convert.base64Decode('CgdBcnRpY2xlEhIKBHNsdWcYASABKAlSBHNsdWcSFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhISCgRib2R5GAQgASgJUgRib2R5EhkKCHRhZ19saXN0GAUgAygJUgd0YWdMaXN0EhwKCWZhdm9yaXRlZBgGIAEoCFIJZmF2b3JpdGVkEjkKCmNyZWF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBInCg9mYXZvcml0ZXNfY291bnQYCSABKAVSDmZhdm9yaXRlc0NvdW50EioKBmF1dGhvchgKIAEoCzISLnJlYWx3b3JsZC5Qcm9maWxlUgZhdXRob3I=');
@$core.Deprecated('Use commentDescriptor instead')
const Comment$json = const {
  '1': 'Comment',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'author', '3': 5, '4': 1, '5': 11, '6': '.realworld.Profile', '10': 'author'},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode('CgdDb21tZW50Eg4KAmlkGAEgASgJUgJpZBISCgRib2R5GAIgASgJUgRib2R5EjkKCmNyZWF0ZWRfYXQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIqCgZhdXRob3IYBSABKAsyEi5yZWFsd29ybGQuUHJvZmlsZVIGYXV0aG9y');
@$core.Deprecated('Use listArticlesRequestDescriptor instead')
const ListArticlesRequest$json = const {
  '1': 'ListArticlesRequest',
  '2': const [
    const {'1': 'filter_kind', '3': 1, '4': 1, '5': 14, '6': '.realworld.FilterKind', '10': 'filterKind'},
    const {'1': 'filter_value', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'filterValue', '17': true},
    const {'1': 'limit', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'limit', '17': true},
    const {'1': 'offset', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'offset', '17': true},
  ],
  '8': const [
    const {'1': '_filter_value'},
    const {'1': '_limit'},
    const {'1': '_offset'},
  ],
};

/// Descriptor for `ListArticlesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listArticlesRequestDescriptor = $convert.base64Decode('ChNMaXN0QXJ0aWNsZXNSZXF1ZXN0EjYKC2ZpbHRlcl9raW5kGAEgASgOMhUucmVhbHdvcmxkLkZpbHRlcktpbmRSCmZpbHRlcktpbmQSJgoMZmlsdGVyX3ZhbHVlGAIgASgJSABSC2ZpbHRlclZhbHVliAEBEhkKBWxpbWl0GAMgASgFSAFSBWxpbWl0iAEBEhsKBm9mZnNldBgEIAEoBUgCUgZvZmZzZXSIAQFCDwoNX2ZpbHRlcl92YWx1ZUIICgZfbGltaXRCCQoHX29mZnNldA==');
@$core.Deprecated('Use getFeedRequestDescriptor instead')
const GetFeedRequest$json = const {
  '1': 'GetFeedRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'limit', '17': true},
    const {'1': 'offset', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'offset', '17': true},
  ],
  '8': const [
    const {'1': '_limit'},
    const {'1': '_offset'},
  ],
};

/// Descriptor for `GetFeedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFeedRequestDescriptor = $convert.base64Decode('Cg5HZXRGZWVkUmVxdWVzdBIZCgVsaW1pdBgBIAEoBUgAUgVsaW1pdIgBARIbCgZvZmZzZXQYAiABKAVIAVIGb2Zmc2V0iAEBQggKBl9saW1pdEIJCgdfb2Zmc2V0');
@$core.Deprecated('Use articleListDescriptor instead')
const ArticleList$json = const {
  '1': 'ArticleList',
  '2': const [
    const {'1': 'articles', '3': 1, '4': 3, '5': 11, '6': '.realworld.ArticleHead', '10': 'articles'},
    const {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    const {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `ArticleList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleListDescriptor = $convert.base64Decode('CgtBcnRpY2xlTGlzdBIyCghhcnRpY2xlcxgBIAMoCzIWLnJlYWx3b3JsZC5BcnRpY2xlSGVhZFIIYXJ0aWNsZXMSHwoLdG90YWxfY291bnQYAiABKAVSCnRvdGFsQ291bnQSGwoJcGFnZV9zaXplGAMgASgFUghwYWdlU2l6ZQ==');
@$core.Deprecated('Use articleResponseDescriptor instead')
const ArticleResponse$json = const {
  '1': 'ArticleResponse',
  '2': const [
    const {'1': 'article', '3': 1, '4': 1, '5': 11, '6': '.realworld.Article', '10': 'article'},
  ],
};

/// Descriptor for `ArticleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articleResponseDescriptor = $convert.base64Decode('Cg9BcnRpY2xlUmVzcG9uc2USLAoHYXJ0aWNsZRgBIAEoCzISLnJlYWx3b3JsZC5BcnRpY2xlUgdhcnRpY2xl');
@$core.Deprecated('Use commentResponseDescriptor instead')
const CommentResponse$json = const {
  '1': 'CommentResponse',
  '2': const [
    const {'1': 'comment', '3': 1, '4': 1, '5': 11, '6': '.realworld.Comment', '10': 'comment'},
  ],
};

/// Descriptor for `CommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentResponseDescriptor = $convert.base64Decode('Cg9Db21tZW50UmVzcG9uc2USLAoHY29tbWVudBgBIAEoCzISLnJlYWx3b3JsZC5Db21tZW50Ugdjb21tZW50');
@$core.Deprecated('Use createArticleRequestDescriptor instead')
const CreateArticleRequest$json = const {
  '1': 'CreateArticleRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'description'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'body'},
    const {'1': 'tag_list', '3': 4, '4': 3, '5': 9, '10': 'tagList'},
  ],
};

/// Descriptor for `CreateArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createArticleRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVBcnRpY2xlUmVxdWVzdBIZCgV0aXRsZRgBIAEoCUID4EECUgV0aXRsZRIlCgtkZXNjcmlwdGlvbhgCIAEoCUID4EECUgtkZXNjcmlwdGlvbhIXCgRib2R5GAMgASgJQgPgQQJSBGJvZHkSGQoIdGFnX2xpc3QYBCADKAlSB3RhZ0xpc3Q=');
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
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    const {'1': 'body', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'body', '17': true},
  ],
  '8': const [
    const {'1': '_title'},
    const {'1': '_description'},
    const {'1': '_body'},
  ],
};

/// Descriptor for `UpdateArticleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateArticleRequestDescriptor = $convert.base64Decode('ChRVcGRhdGVBcnRpY2xlUmVxdWVzdBIXCgRzbHVnGAEgASgJQgPgQQJSBHNsdWcSGQoFdGl0bGUYAiABKAlIAFIFdGl0bGWIAQESJQoLZGVzY3JpcHRpb24YAyABKAlIAVILZGVzY3JpcHRpb26IAQESFwoEYm9keRgEIAEoCUgCUgRib2R5iAEBQggKBl90aXRsZUIOCgxfZGVzY3JpcHRpb25CBwoFX2JvZHk=');
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
