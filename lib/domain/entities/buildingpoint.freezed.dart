// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buildingpoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuildingPoint _$BuildingPointFromJson(Map<String, dynamic> json) {
  return _BuildingPoint.fromJson(json);
}

/// @nodoc
mixin _$BuildingPoint {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  BuildingPointStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildingPointCopyWith<BuildingPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingPointCopyWith<$Res> {
  factory $BuildingPointCopyWith(
          BuildingPoint value, $Res Function(BuildingPoint) then) =
      _$BuildingPointCopyWithImpl<$Res, BuildingPoint>;
  @useResult
  $Res call({int x, int y, BuildingPointStatus status});
}

/// @nodoc
class _$BuildingPointCopyWithImpl<$Res, $Val extends BuildingPoint>
    implements $BuildingPointCopyWith<$Res> {
  _$BuildingPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BuildingPointStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuildingPointImplCopyWith<$Res>
    implements $BuildingPointCopyWith<$Res> {
  factory _$$BuildingPointImplCopyWith(
          _$BuildingPointImpl value, $Res Function(_$BuildingPointImpl) then) =
      __$$BuildingPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y, BuildingPointStatus status});
}

/// @nodoc
class __$$BuildingPointImplCopyWithImpl<$Res>
    extends _$BuildingPointCopyWithImpl<$Res, _$BuildingPointImpl>
    implements _$$BuildingPointImplCopyWith<$Res> {
  __$$BuildingPointImplCopyWithImpl(
      _$BuildingPointImpl _value, $Res Function(_$BuildingPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? status = null,
  }) {
    return _then(_$BuildingPointImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BuildingPointStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuildingPointImpl extends _BuildingPoint {
  _$BuildingPointImpl({required this.x, required this.y, required this.status})
      : super._();

  factory _$BuildingPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuildingPointImplFromJson(json);

  @override
  final int x;
  @override
  final int y;
  @override
  final BuildingPointStatus status;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildingPointImplCopyWith<_$BuildingPointImpl> get copyWith =>
      __$$BuildingPointImplCopyWithImpl<_$BuildingPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuildingPointImplToJson(
      this,
    );
  }
}

abstract class _BuildingPoint extends BuildingPoint {
  factory _BuildingPoint(
      {required final int x,
      required final int y,
      required final BuildingPointStatus status}) = _$BuildingPointImpl;
  _BuildingPoint._() : super._();

  factory _BuildingPoint.fromJson(Map<String, dynamic> json) =
      _$BuildingPointImpl.fromJson;

  @override
  int get x;
  @override
  int get y;
  @override
  BuildingPointStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$BuildingPointImplCopyWith<_$BuildingPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
