///
//  Generated code. Do not modify.
//  source: realworld/auth_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSGQoFZW1haWwYASABKAlCA+BBAlIFZW1haWwSHwoIcGFzc3dvcmQYAiABKAlCA+BBAlIIcGFzc3dvcmQ=');
@$core.Deprecated('Use signupRequestDescriptor instead')
const SignupRequest$json = const {
  '1': 'SignupRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'username'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'password'},
  ],
};

/// Descriptor for `SignupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signupRequestDescriptor = $convert.base64Decode('Cg1TaWdudXBSZXF1ZXN0Eh8KCHVzZXJuYW1lGAEgASgJQgPgQQJSCHVzZXJuYW1lEhkKBWVtYWlsGAIgASgJQgPgQQJSBWVtYWlsEh8KCHBhc3N3b3JkGAMgASgJQgPgQQJSCHBhc3N3b3Jk');
