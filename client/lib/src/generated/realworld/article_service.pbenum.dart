///
//  Generated code. Do not modify.
//  source: realworld/article_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class FilterKind extends $pb.ProtobufEnum {
  static const FilterKind NONE = FilterKind._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const FilterKind TAG = FilterKind._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TAG');
  static const FilterKind AUTHOR = FilterKind._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTHOR');
  static const FilterKind FAVORITED_BY = FilterKind._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAVORITED_BY');

  static const $core.List<FilterKind> values = <FilterKind> [
    NONE,
    TAG,
    AUTHOR,
    FAVORITED_BY,
  ];

  static final $core.Map<$core.int, FilterKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FilterKind? valueOf($core.int value) => _byValue[value];

  const FilterKind._($core.int v, $core.String n) : super(v, n);
}

