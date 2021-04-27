import 'package:grpc/grpc.dart';

import 'generated/realworld/article_service.pb.dart';
import 'generated/realworld/common.pb.dart';
import 'generated/realworld/user_service.pbgrpc.dart';
import 'model/model.dart' as model;

model.Article toArticle(Article a) => a.toModel();

model.Comment toComment(Comment c) => c.toModel();

model.ArticleHead toArticleHead(ArticleHead a) => a.toModel();

extension ProtoToUser on User {
  model.User toModel() {
    return model.User(
      token: token,
      email: email,
      username: username,
      bio: bio.isEmpty ? null : bio,
      image: image.isEmpty ? null : image,
    );
  }
}

extension ProtoToArticleHead on ArticleHead {
  model.ArticleHead toModel() {
    return model.ArticleHead(
      slug: slug,
      title: title,
      description: description,
      tags: tagList,
      createdAt: DateTime.now(),
      favoritesCount: favoritesCount,
      authorUsername: author,
    );
  }
}

extension ProtoToArticle on Article {
  model.Article toModel() {
    return model.Article(
      slug: slug,
      title: title,
      description: description,
      body: body,
      tags: tagList,
      //  TODO: convert datetimes
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      favorited: favorited,
      favoritesCount: favoritesCount,
      author: author.toModel(),
    );
  }
}

extension ProtoToAuthor on Profile {
  model.Profile toModel() {
    return model.Profile(
      username: username,
      following: following,
      bio: bio.isEmpty ? null : bio,
      image: image.isEmpty ? null : image,
    );
  }
}

extension ProtoToComment on Comment {
  model.Comment toModel() {
    return model.Comment(
      id: id,
      author: author.toModel(),
      //  TODO: convert datetimes
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
      body: body,
    );
  }
}

FilterKind filterToProto(model.FilterKind kind) {
  switch (kind) {
    case model.FilterKind.none:
      return FilterKind.NONE;
    case model.FilterKind.tag:
      return FilterKind.TAG;
    case model.FilterKind.author:
      return FilterKind.AUTHOR;
    case model.FilterKind.favoritedBy:
      return FilterKind.FAVORITED_BY;
  }
}

String _errorMessageForCode(int code) {
  assert(code != StatusCode.ok, 'StatusCode.ok is not an error');

  switch (code) {
    case StatusCode.invalidArgument:
      return 'Validation failed';
    case StatusCode.notFound:
      return 'Resource not found';
    case StatusCode.alreadyExists:
      return 'Resource exists';
    case StatusCode.permissionDenied:
      return 'Permission denied';
    case StatusCode.unauthenticated:
      return 'Authentication required';
    case StatusCode.unimplemented:
      return 'Unimplemented';
    default:
      return 'Server Error [$code]';
  }
}

extension ToConduit on GrpcError {
  model.ConduitException toConduitException() {
    Map<String, String>? fieldErrors;

    if (details != null) {
      for (final detail in details!) {
        if (detail is BadRequest) {
          fieldErrors = {};
          for (final error in detail.fieldViolations) {
            fieldErrors[error.getField(1) as String] =
                error.getField(2) as String;
          }
        }
      }
    }

    return model.ConduitException(_errorMessageForCode(code), fieldErrors);
  }
}
