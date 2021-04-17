///
//  Generated code. Do not modify.
//  source: realworld/common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use profileDescriptor instead')
const Profile$json = const {
  '1': 'Profile',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'bio', '3': 2, '4': 1, '5': 9, '10': 'bio'},
    const {'1': 'image', '3': 3, '4': 1, '5': 9, '10': 'image'},
    const {'1': 'following', '3': 4, '4': 1, '5': 8, '10': 'following'},
  ],
};

/// Descriptor for `Profile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileDescriptor = $convert.base64Decode('CgdQcm9maWxlEhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIQCgNiaW8YAiABKAlSA2JpbxIUCgVpbWFnZRgDIAEoCVIFaW1hZ2USHAoJZm9sbG93aW5nGAQgASgIUglmb2xsb3dpbmc=');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'bio', '3': 4, '4': 1, '5': 9, '10': 'bio'},
    const {'1': 'image', '3': 5, '4': 1, '5': 9, '10': 'image'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEhQKBXRva2VuGAEgASgJUgV0b2tlbhIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEhAKA2JpbxgEIAEoCVIDYmlvEhQKBWltYWdlGAUgASgJUgVpbWFnZQ==');
