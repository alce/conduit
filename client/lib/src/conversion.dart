import 'package:grpc/grpc.dart';

import 'generated/realworld/article_service.pb.dart';
import 'generated/realworld/common.pb.dart';
import 'model/model.dart' as model;

model.Article toArticle(Article a) => a.toModel();

model.Comment toComment(Comment c) => c.toModel();

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

extension ProtoToArticle on Article {
  model.Article toModel() {
    return model.Article(
      slug: slug,
      title: title,
      description: description,
      body: body,
      tags: tagList,
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
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
      body: body,
    );
  }
}

String _errorMessageForCode(int code) {
  assert(code != StatusCode.ok, 'StatusCode.ok is not an error');

  switch (code) {
    case StatusCode.invalidArgument:
      // final errors = <String, String>{};
      // print('DETAILS: $details');
      return 'Validation failed';
    case StatusCode.notFound:
      return 'Resource not found';
    case StatusCode.alreadyExists:
      return 'Taken';
    case StatusCode.permissionDenied:
      return 'Permission denied';
    case StatusCode.unauthenticated:
      return 'Authentication required';
    case StatusCode.unimplemented:
      return 'Unimplemented';

    case StatusCode.cancelled:
    case StatusCode.unknown:
    case StatusCode.deadlineExceeded:
    case StatusCode.resourceExhausted:
    case StatusCode.failedPrecondition:
    case StatusCode.aborted:
    case StatusCode.outOfRange:
    case StatusCode.internal:
    case StatusCode.unavailable:
    case StatusCode.dataLoss:
    default:
      return 'Internal Error';
  }
}

extension ToConduit on GrpcError {
  model.ConduitException toConduitException() {
    return model.ConduitException(_errorMessageForCode(code));
  }
}
