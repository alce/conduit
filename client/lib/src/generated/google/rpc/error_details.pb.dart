///
//  Generated code. Do not modify.
//  source: google/rpc/error_details.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BadRequest_FieldViolation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BadRequest.FieldViolation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'google.rpc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'field')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  BadRequest_FieldViolation._() : super();
  factory BadRequest_FieldViolation({
    $core.String? field_1,
    $core.String? description,
  }) {
    final _result = create();
    if (field_1 != null) {
      _result.field_1 = field_1;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory BadRequest_FieldViolation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BadRequest_FieldViolation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BadRequest_FieldViolation clone() => BadRequest_FieldViolation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BadRequest_FieldViolation copyWith(void Function(BadRequest_FieldViolation) updates) => super.copyWith((message) => updates(message as BadRequest_FieldViolation)) as BadRequest_FieldViolation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BadRequest_FieldViolation create() => BadRequest_FieldViolation._();
  BadRequest_FieldViolation createEmptyInstance() => create();
  static $pb.PbList<BadRequest_FieldViolation> createRepeated() => $pb.PbList<BadRequest_FieldViolation>();
  @$core.pragma('dart2js:noInline')
  static BadRequest_FieldViolation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BadRequest_FieldViolation>(create);
  static BadRequest_FieldViolation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get field_1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set field_1($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasField_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearField_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class BadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BadRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'google.rpc'), createEmptyInstance: create)
    ..pc<BadRequest_FieldViolation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldViolations', $pb.PbFieldType.PM, subBuilder: BadRequest_FieldViolation.create)
    ..hasRequiredFields = false
  ;

  BadRequest._() : super();
  factory BadRequest({
    $core.Iterable<BadRequest_FieldViolation>? fieldViolations,
  }) {
    final _result = create();
    if (fieldViolations != null) {
      _result.fieldViolations.addAll(fieldViolations);
    }
    return _result;
  }
  factory BadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BadRequest clone() => BadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BadRequest copyWith(void Function(BadRequest) updates) => super.copyWith((message) => updates(message as BadRequest)) as BadRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BadRequest create() => BadRequest._();
  BadRequest createEmptyInstance() => create();
  static $pb.PbList<BadRequest> createRepeated() => $pb.PbList<BadRequest>();
  @$core.pragma('dart2js:noInline')
  static BadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BadRequest>(create);
  static BadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BadRequest_FieldViolation> get fieldViolations => $_getList(0);
}

