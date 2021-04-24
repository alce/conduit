///
//  Generated code. Do not modify.
//  source: google/rpc/error_details.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use badRequestDescriptor instead')
const BadRequest$json = const {
  '1': 'BadRequest',
  '2': const [
    const {'1': 'field_violations', '3': 1, '4': 3, '5': 11, '6': '.google.rpc.BadRequest.FieldViolation', '10': 'fieldViolations'},
  ],
  '3': const [BadRequest_FieldViolation$json],
};

@$core.Deprecated('Use badRequestDescriptor instead')
const BadRequest_FieldViolation$json = const {
  '1': 'FieldViolation',
  '2': const [
    const {'1': 'field', '3': 1, '4': 1, '5': 9, '10': 'field'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `BadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List badRequestDescriptor = $convert.base64Decode('CgpCYWRSZXF1ZXN0ElAKEGZpZWxkX3Zpb2xhdGlvbnMYASADKAsyJS5nb29nbGUucnBjLkJhZFJlcXVlc3QuRmllbGRWaW9sYXRpb25SD2ZpZWxkVmlvbGF0aW9ucxpICg5GaWVsZFZpb2xhdGlvbhIUCgVmaWVsZBgBIAEoCVIFZmllbGQSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9u');
