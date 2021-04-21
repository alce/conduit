///
//  Generated code. Do not modify.
//  source: realworld/user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'bio', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'bio', '17': true},
    const {'1': 'image', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'image', '17': true},
  ],
  '8': const [
    const {'1': '_bio'},
    const {'1': '_image'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEhQKBXRva2VuGAEgASgJUgV0b2tlbhIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEhUKA2JpbxgEIAEoCUgAUgNiaW+IAQESGQoFaW1hZ2UYBSABKAlIAVIFaW1hZ2WIAQFCBgoEX2Jpb0IICgZfaW1hZ2U=');
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
@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = const {
  '1': 'CreateUserRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'email'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'username'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'password'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVVc2VyUmVxdWVzdBIZCgVlbWFpbBgBIAEoCUID4EECUgVlbWFpbBIfCgh1c2VybmFtZRgCIAEoCUID4EECUgh1c2VybmFtZRIfCghwYXNzd29yZBgDIAEoCUID4EECUghwYXNzd29yZA==');
@$core.Deprecated('Use getCurrentUserRequestDescriptor instead')
const GetCurrentUserRequest$json = const {
  '1': 'GetCurrentUserRequest',
};

/// Descriptor for `GetCurrentUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentUserRequestDescriptor = $convert.base64Decode('ChVHZXRDdXJyZW50VXNlclJlcXVlc3Q=');
@$core.Deprecated('Use updateProfileRequestDescriptor instead')
const UpdateProfileRequest$json = const {
  '1': 'UpdateProfileRequest',
  '2': const [
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'username', '17': true},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'email', '17': true},
    const {'1': 'bio', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'bio', '17': true},
    const {'1': 'image', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'image', '17': true},
  ],
  '8': const [
    const {'1': '_username'},
    const {'1': '_email'},
    const {'1': '_bio'},
    const {'1': '_image'},
  ],
};

/// Descriptor for `UpdateProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileRequestDescriptor = $convert.base64Decode('ChRVcGRhdGVQcm9maWxlUmVxdWVzdBIfCgh1c2VybmFtZRgCIAEoCUgAUgh1c2VybmFtZYgBARIZCgVlbWFpbBgDIAEoCUgBUgVlbWFpbIgBARIVCgNiaW8YBCABKAlIAlIDYmlviAEBEhkKBWltYWdlGAUgASgJSANSBWltYWdliAEBQgsKCV91c2VybmFtZUIICgZfZW1haWxCBgoEX2Jpb0IICgZfaW1hZ2U=');
@$core.Deprecated('Use updatePasswordRequestDescriptor instead')
const UpdatePasswordRequest$json = const {
  '1': 'UpdatePasswordRequest',
  '2': const [
    const {'1': 'password', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'password', '17': true},
  ],
  '8': const [
    const {'1': '_password'},
  ],
};

/// Descriptor for `UpdatePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePasswordRequestDescriptor = $convert.base64Decode('ChVVcGRhdGVQYXNzd29yZFJlcXVlc3QSHwoIcGFzc3dvcmQYASABKAlIAFIIcGFzc3dvcmSIAQFCCwoJX3Bhc3N3b3Jk');
@$core.Deprecated('Use getProfileRequestDescriptor instead')
const GetProfileRequest$json = const {
  '1': 'GetProfileRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'username'},
  ],
};

/// Descriptor for `GetProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileRequestDescriptor = $convert.base64Decode('ChFHZXRQcm9maWxlUmVxdWVzdBIfCgh1c2VybmFtZRgBIAEoCUID4EECUgh1c2VybmFtZQ==');
@$core.Deprecated('Use followUserRequestDescriptor instead')
const FollowUserRequest$json = const {
  '1': 'FollowUserRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'username'},
  ],
};

/// Descriptor for `FollowUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followUserRequestDescriptor = $convert.base64Decode('ChFGb2xsb3dVc2VyUmVxdWVzdBIfCgh1c2VybmFtZRgBIAEoCUID4EECUgh1c2VybmFtZQ==');
@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = const {
  '1': 'DeleteUserRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'username'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode('ChFEZWxldGVVc2VyUmVxdWVzdBIfCgh1c2VybmFtZRgBIAEoCUID4EECUgh1c2VybmFtZQ==');
@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = const {
  '1': 'UserResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.realworld.User', '10': 'user'},
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode('CgxVc2VyUmVzcG9uc2USIwoEdXNlchgBIAEoCzIPLnJlYWx3b3JsZC5Vc2VyUgR1c2Vy');
