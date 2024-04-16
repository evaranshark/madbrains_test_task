// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'building_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuildingObject _$BuildingObjectFromJson(Map<String, dynamic> json) {
  return _BuildingObject.fromJson(json);
}

/// @nodoc
mixin _$BuildingObject {
  String get title => throw _privateConstructorUsedError;
  int get remainingPoints => throw _privateConstructorUsedError;
  int get totalPointsCount => throw _privateConstructorUsedError;
  List<BuildingPoint> get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildingObjectCopyWith<BuildingObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingObjectCopyWith<$Res> {
  factory $BuildingObjectCopyWith(
          BuildingObject value, $Res Function(BuildingObject) then) =
      _$BuildingObjectCopyWithImpl<$Res, BuildingObject>;
  @useResult
  $Res call(
      {String title,
      int remainingPoints,
      int totalPointsCount,
      List<BuildingPoint> points});
}

/// @nodoc
class _$BuildingObjectCopyWithImpl<$Res, $Val extends BuildingObject>
    implements $BuildingObjectCopyWith<$Res> {
  _$BuildingObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? remainingPoints = null,
    Object? totalPointsCount = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      remainingPoints: null == remainingPoints
          ? _value.remainingPoints
          : remainingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPointsCount: null == totalPointsCount
          ? _value.totalPointsCount
          : totalPointsCount // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<BuildingPoint>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuildingObjectImplCopyWith<$Res>
    implements $BuildingObjectCopyWith<$Res> {
  factory _$$BuildingObjectImplCopyWith(_$BuildingObjectImpl value,
          $Res Function(_$BuildingObjectImpl) then) =
      __$$BuildingObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      int remainingPoints,
      int totalPointsCount,
      List<BuildingPoint> points});
}

/// @nodoc
class __$$BuildingObjectImplCopyWithImpl<$Res>
    extends _$BuildingObjectCopyWithImpl<$Res, _$BuildingObjectImpl>
    implements _$$BuildingObjectImplCopyWith<$Res> {
  __$$BuildingObjectImplCopyWithImpl(
      _$BuildingObjectImpl _value, $Res Function(_$BuildingObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? remainingPoints = null,
    Object? totalPointsCount = null,
    Object? points = null,
  }) {
    return _then(_$BuildingObjectImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      remainingPoints: null == remainingPoints
          ? _value.remainingPoints
          : remainingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPointsCount: null == totalPointsCount
          ? _value.totalPointsCount
          : totalPointsCount // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<BuildingPoint>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BuildingObjectImpl extends _BuildingObject {
  const _$BuildingObjectImpl(
      {required this.title,
      required this.remainingPoints,
      required this.totalPointsCount,
      required final List<BuildingPoint> points})
      : _points = points,
        super._();

  factory _$BuildingObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuildingObjectImplFromJson(json);

  @override
  final String title;
  @override
  final int remainingPoints;
  @override
  final int totalPointsCount;
  final List<BuildingPoint> _points;
  @override
  List<BuildingPoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildingObjectImplCopyWith<_$BuildingObjectImpl> get copyWith =>
      __$$BuildingObjectImplCopyWithImpl<_$BuildingObjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuildingObjectImplToJson(
      this,
    );
  }
}

abstract class _BuildingObject extends BuildingObject {
  const factory _BuildingObject(
      {required final String title,
      required final int remainingPoints,
      required final int totalPointsCount,
      required final List<BuildingPoint> points}) = _$BuildingObjectImpl;
  const _BuildingObject._() : super._();

  factory _BuildingObject.fromJson(Map<String, dynamic> json) =
      _$BuildingObjectImpl.fromJson;

  @override
  String get title;
  @override
  int get remainingPoints;
  @override
  int get totalPointsCount;
  @override
  List<BuildingPoint> get points;
  @override
  @JsonKey(ignore: true)
  _$$BuildingObjectImplCopyWith<_$BuildingObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
