///
//  Generated code. Do not modify.
//  source: realworld/user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getCurrentUserRequestDescriptor instead')
const GetCurrentUserRequest$json = const {
  '1': 'GetCurrentUserRequest',
};

/// Descriptor for `GetCurrentUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentUserRequestDescriptor = $convert.base64Decode('ChVHZXRDdXJyZW50VXNlclJlcXVlc3Q=');
@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = const {
  '1': 'UpdateUserRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.realworld.User', '8': const {}, '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUmVxdWVzdBIoCgR1c2VyGAEgASgLMg8ucmVhbHdvcmxkLlVzZXJCA+BBAlIEdXNlcg==');
@$core.Deprecated('Use getProfileRequestDescriptor instead')
const GetProfileRequest$json = const {
  '1': 'GetProfileRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'username'},
  ],
};

/// Descriptor for `GetProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileRequestDescriptor = $convert.base64Decode('ChFHZXRQcm9maWxlUmVxdWVzdBIfCgh1c2VybmFtZRgBIAEoCUID4EECUgh1c2VybmFtZQ==');
@$core.Deprecated('Use toggleFollowUserRequestDescriptor instead')
const ToggleFollowUserRequest$json = const {
  '1': 'ToggleFollowUserRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'username'},
  ],
};

/// Descriptor for `ToggleFollowUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toggleFollowUserRequestDescriptor = $convert.base64Decode('ChdUb2dnbGVGb2xsb3dVc2VyUmVxdWVzdBIfCgh1c2VybmFtZRgBIAEoCUID4EECUgh1c2VybmFtZQ==');
