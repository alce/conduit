///
//  Generated code. Do not modify.
//  source: realworld/user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_service.pb.dart' as $4;
import 'common.pb.dart' as $3;
export 'user_service.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$getCurrentUser =
      $grpc.ClientMethod<$4.GetCurrentUserRequest, $3.User>(
          '/realworld.UserService/GetCurrentUser',
          ($4.GetCurrentUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$4.UpdateUserRequest, $3.User>(
      '/realworld.UserService/UpdateUser',
      ($4.UpdateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$toggleFollowUser =
      $grpc.ClientMethod<$4.ToggleFollowUserRequest, $3.Profile>(
          '/realworld.UserService/ToggleFollowUser',
          ($4.ToggleFollowUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Profile.fromBuffer(value));
  static final _$getProfile =
      $grpc.ClientMethod<$4.GetProfileRequest, $3.Profile>(
          '/realworld.UserService/GetProfile',
          ($4.GetProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Profile.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.User> getCurrentUser($4.GetCurrentUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCurrentUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> updateUser($4.UpdateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.Profile> toggleFollowUser(
      $4.ToggleFollowUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$toggleFollowUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.Profile> getProfile($4.GetProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'realworld.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.GetCurrentUserRequest, $3.User>(
        'GetCurrentUser',
        getCurrentUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetCurrentUserRequest.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UpdateUserRequest, $3.User>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UpdateUserRequest.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.ToggleFollowUserRequest, $3.Profile>(
        'ToggleFollowUser',
        toggleFollowUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.ToggleFollowUserRequest.fromBuffer(value),
        ($3.Profile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetProfileRequest, $3.Profile>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetProfileRequest.fromBuffer(value),
        ($3.Profile value) => value.writeToBuffer()));
  }

  $async.Future<$3.User> getCurrentUser_Pre($grpc.ServiceCall call,
      $async.Future<$4.GetCurrentUserRequest> request) async {
    return getCurrentUser(call, await request);
  }

  $async.Future<$3.User> updateUser_Pre($grpc.ServiceCall call,
      $async.Future<$4.UpdateUserRequest> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$3.Profile> toggleFollowUser_Pre($grpc.ServiceCall call,
      $async.Future<$4.ToggleFollowUserRequest> request) async {
    return toggleFollowUser(call, await request);
  }

  $async.Future<$3.Profile> getProfile_Pre($grpc.ServiceCall call,
      $async.Future<$4.GetProfileRequest> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$3.User> getCurrentUser(
      $grpc.ServiceCall call, $4.GetCurrentUserRequest request);
  $async.Future<$3.User> updateUser(
      $grpc.ServiceCall call, $4.UpdateUserRequest request);
  $async.Future<$3.Profile> toggleFollowUser(
      $grpc.ServiceCall call, $4.ToggleFollowUserRequest request);
  $async.Future<$3.Profile> getProfile(
      $grpc.ServiceCall call, $4.GetProfileRequest request);
}
