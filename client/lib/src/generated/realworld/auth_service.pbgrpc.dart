///
//  Generated code. Do not modify.
//  source: realworld/auth_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth_service.pb.dart' as $2;
import 'common.pb.dart' as $3;
export 'auth_service.pb.dart';

class AuthServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$2.LoginRequest, $3.User>(
      '/realworld.AuthService/Login',
      ($2.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$signup = $grpc.ClientMethod<$2.SignupRequest, $3.User>(
      '/realworld.AuthService/Signup',
      ($2.SignupRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.User> login($2.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> signup($2.SignupRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signup, request, options: options);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'realworld.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.LoginRequest, $3.User>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.LoginRequest.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SignupRequest, $3.User>(
        'Signup',
        signup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SignupRequest.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
  }

  $async.Future<$3.User> login_Pre(
      $grpc.ServiceCall call, $async.Future<$2.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$3.User> signup_Pre(
      $grpc.ServiceCall call, $async.Future<$2.SignupRequest> request) async {
    return signup(call, await request);
  }

  $async.Future<$3.User> login($grpc.ServiceCall call, $2.LoginRequest request);
  $async.Future<$3.User> signup(
      $grpc.ServiceCall call, $2.SignupRequest request);
}
