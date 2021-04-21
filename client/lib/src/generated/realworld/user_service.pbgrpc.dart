///
//  Generated code. Do not modify.
//  source: realworld/user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_service.pb.dart' as $2;
import '../google/protobuf/empty.pb.dart' as $1;
import 'common.pb.dart' as $3;
export 'user_service.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$2.LoginRequest, $2.UserResponse>(
      '/realworld.UserService/Login',
      ($2.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.UserResponse.fromBuffer(value));
  static final _$create =
      $grpc.ClientMethod<$2.CreateUserRequest, $2.UserResponse>(
          '/realworld.UserService/Create',
          ($2.CreateUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.UserResponse.fromBuffer(value));
  static final _$getCurrent =
      $grpc.ClientMethod<$2.GetCurrentUserRequest, $2.UserResponse>(
          '/realworld.UserService/GetCurrent',
          ($2.GetCurrentUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.UserResponse.fromBuffer(value));
  static final _$updateProfile =
      $grpc.ClientMethod<$2.UpdateProfileRequest, $2.UserResponse>(
          '/realworld.UserService/UpdateProfile',
          ($2.UpdateProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.UserResponse.fromBuffer(value));
  static final _$updatePassword =
      $grpc.ClientMethod<$2.UpdatePasswordRequest, $1.Empty>(
          '/realworld.UserService/UpdatePassword',
          ($2.UpdatePasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getProfile =
      $grpc.ClientMethod<$2.GetProfileRequest, $3.Profile>(
          '/realworld.UserService/GetProfile',
          ($2.GetProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Profile.fromBuffer(value));
  static final _$followUser =
      $grpc.ClientMethod<$2.FollowUserRequest, $3.Profile>(
          '/realworld.UserService/FollowUser',
          ($2.FollowUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Profile.fromBuffer(value));
  static final _$unfollowUser =
      $grpc.ClientMethod<$2.FollowUserRequest, $3.Profile>(
          '/realworld.UserService/UnfollowUser',
          ($2.FollowUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Profile.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$2.DeleteUserRequest, $1.Empty>(
          '/realworld.UserService/DeleteUser',
          ($2.DeleteUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.UserResponse> login($2.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$2.UserResponse> create($2.CreateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$2.UserResponse> getCurrent(
      $2.GetCurrentUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCurrent, request, options: options);
  }

  $grpc.ResponseFuture<$2.UserResponse> updateProfile(
      $2.UpdateProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updatePassword(
      $2.UpdatePasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePassword, request, options: options);
  }

  $grpc.ResponseFuture<$3.Profile> getProfile($2.GetProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }

  $grpc.ResponseFuture<$3.Profile> followUser($2.FollowUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$followUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.Profile> unfollowUser($2.FollowUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unfollowUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteUser($2.DeleteUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'realworld.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.LoginRequest, $2.UserResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.LoginRequest.fromBuffer(value),
        ($2.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreateUserRequest, $2.UserResponse>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateUserRequest.fromBuffer(value),
        ($2.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetCurrentUserRequest, $2.UserResponse>(
        'GetCurrent',
        getCurrent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetCurrentUserRequest.fromBuffer(value),
        ($2.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdateProfileRequest, $2.UserResponse>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.UpdateProfileRequest.fromBuffer(value),
        ($2.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdatePasswordRequest, $1.Empty>(
        'UpdatePassword',
        updatePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.UpdatePasswordRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetProfileRequest, $3.Profile>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetProfileRequest.fromBuffer(value),
        ($3.Profile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FollowUserRequest, $3.Profile>(
        'FollowUser',
        followUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FollowUserRequest.fromBuffer(value),
        ($3.Profile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FollowUserRequest, $3.Profile>(
        'UnfollowUser',
        unfollowUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FollowUserRequest.fromBuffer(value),
        ($3.Profile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteUserRequest, $1.Empty>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteUserRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$2.UserResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$2.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$2.UserResponse> create_Pre($grpc.ServiceCall call,
      $async.Future<$2.CreateUserRequest> request) async {
    return create(call, await request);
  }

  $async.Future<$2.UserResponse> getCurrent_Pre($grpc.ServiceCall call,
      $async.Future<$2.GetCurrentUserRequest> request) async {
    return getCurrent(call, await request);
  }

  $async.Future<$2.UserResponse> updateProfile_Pre($grpc.ServiceCall call,
      $async.Future<$2.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$1.Empty> updatePassword_Pre($grpc.ServiceCall call,
      $async.Future<$2.UpdatePasswordRequest> request) async {
    return updatePassword(call, await request);
  }

  $async.Future<$3.Profile> getProfile_Pre($grpc.ServiceCall call,
      $async.Future<$2.GetProfileRequest> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$3.Profile> followUser_Pre($grpc.ServiceCall call,
      $async.Future<$2.FollowUserRequest> request) async {
    return followUser(call, await request);
  }

  $async.Future<$3.Profile> unfollowUser_Pre($grpc.ServiceCall call,
      $async.Future<$2.FollowUserRequest> request) async {
    return unfollowUser(call, await request);
  }

  $async.Future<$1.Empty> deleteUser_Pre($grpc.ServiceCall call,
      $async.Future<$2.DeleteUserRequest> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$2.UserResponse> login(
      $grpc.ServiceCall call, $2.LoginRequest request);
  $async.Future<$2.UserResponse> create(
      $grpc.ServiceCall call, $2.CreateUserRequest request);
  $async.Future<$2.UserResponse> getCurrent(
      $grpc.ServiceCall call, $2.GetCurrentUserRequest request);
  $async.Future<$2.UserResponse> updateProfile(
      $grpc.ServiceCall call, $2.UpdateProfileRequest request);
  $async.Future<$1.Empty> updatePassword(
      $grpc.ServiceCall call, $2.UpdatePasswordRequest request);
  $async.Future<$3.Profile> getProfile(
      $grpc.ServiceCall call, $2.GetProfileRequest request);
  $async.Future<$3.Profile> followUser(
      $grpc.ServiceCall call, $2.FollowUserRequest request);
  $async.Future<$3.Profile> unfollowUser(
      $grpc.ServiceCall call, $2.FollowUserRequest request);
  $async.Future<$1.Empty> deleteUser(
      $grpc.ServiceCall call, $2.DeleteUserRequest request);
}
