// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return _Alert.fromJson(json);
}

/// @nodoc
mixin _$Alert {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_to_track')
  String get nameToTrack => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Alert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertCopyWith<Alert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) then) =
      _$AlertCopyWithImpl<$Res, Alert>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_to_track') String nameToTrack,
      @JsonKey(name: 'is_active') bool isActive,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AlertCopyWithImpl<$Res, $Val extends Alert>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameToTrack = null,
    Object? isActive = null,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameToTrack: null == nameToTrack
          ? _value.nameToTrack
          : nameToTrack // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlertImplCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$$AlertImplCopyWith(
          _$AlertImpl value, $Res Function(_$AlertImpl) then) =
      __$$AlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_to_track') String nameToTrack,
      @JsonKey(name: 'is_active') bool isActive,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AlertImplCopyWithImpl<$Res>
    extends _$AlertCopyWithImpl<$Res, _$AlertImpl>
    implements _$$AlertImplCopyWith<$Res> {
  __$$AlertImplCopyWithImpl(
      _$AlertImpl _value, $Res Function(_$AlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameToTrack = null,
    Object? isActive = null,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameToTrack: null == nameToTrack
          ? _value.nameToTrack
          : nameToTrack // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertImpl implements _Alert {
  const _$AlertImpl(
      {required this.id,
      @JsonKey(name: 'name_to_track') required this.nameToTrack,
      @JsonKey(name: 'is_active') required this.isActive,
      this.user,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$AlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name_to_track')
  final String nameToTrack;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  final User? user;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Alert(id: $id, nameToTrack: $nameToTrack, isActive: $isActive, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameToTrack, nameToTrack) ||
                other.nameToTrack == nameToTrack) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nameToTrack, isActive, user, createdAt, updatedAt);

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      __$$AlertImplCopyWithImpl<_$AlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertImplToJson(
      this,
    );
  }
}

abstract class _Alert implements Alert {
  const factory _Alert(
      {required final int id,
      @JsonKey(name: 'name_to_track') required final String nameToTrack,
      @JsonKey(name: 'is_active') required final bool isActive,
      final User? user,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$AlertImpl;

  factory _Alert.fromJson(Map<String, dynamic> json) = _$AlertImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'name_to_track')
  String get nameToTrack;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  User? get user;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlertsResponse _$AlertsResponseFromJson(Map<String, dynamic> json) {
  return _AlertsResponse.fromJson(json);
}

/// @nodoc
mixin _$AlertsResponse {
  List<Alert> get alerts => throw _privateConstructorUsedError;

  /// Serializes this AlertsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlertsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertsResponseCopyWith<AlertsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertsResponseCopyWith<$Res> {
  factory $AlertsResponseCopyWith(
          AlertsResponse value, $Res Function(AlertsResponse) then) =
      _$AlertsResponseCopyWithImpl<$Res, AlertsResponse>;
  @useResult
  $Res call({List<Alert> alerts});
}

/// @nodoc
class _$AlertsResponseCopyWithImpl<$Res, $Val extends AlertsResponse>
    implements $AlertsResponseCopyWith<$Res> {
  _$AlertsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlertsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alerts = null,
  }) {
    return _then(_value.copyWith(
      alerts: null == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<Alert>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertsResponseImplCopyWith<$Res>
    implements $AlertsResponseCopyWith<$Res> {
  factory _$$AlertsResponseImplCopyWith(_$AlertsResponseImpl value,
          $Res Function(_$AlertsResponseImpl) then) =
      __$$AlertsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Alert> alerts});
}

/// @nodoc
class __$$AlertsResponseImplCopyWithImpl<$Res>
    extends _$AlertsResponseCopyWithImpl<$Res, _$AlertsResponseImpl>
    implements _$$AlertsResponseImplCopyWith<$Res> {
  __$$AlertsResponseImplCopyWithImpl(
      _$AlertsResponseImpl _value, $Res Function(_$AlertsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlertsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alerts = null,
  }) {
    return _then(_$AlertsResponseImpl(
      alerts: null == alerts
          ? _value._alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<Alert>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertsResponseImpl implements _AlertsResponse {
  const _$AlertsResponseImpl({required final List<Alert> alerts})
      : _alerts = alerts;

  factory _$AlertsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertsResponseImplFromJson(json);

  final List<Alert> _alerts;
  @override
  List<Alert> get alerts {
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alerts);
  }

  @override
  String toString() {
    return 'AlertsResponse(alerts: $alerts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertsResponseImpl &&
            const DeepCollectionEquality().equals(other._alerts, _alerts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_alerts));

  /// Create a copy of AlertsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertsResponseImplCopyWith<_$AlertsResponseImpl> get copyWith =>
      __$$AlertsResponseImplCopyWithImpl<_$AlertsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertsResponseImplToJson(
      this,
    );
  }
}

abstract class _AlertsResponse implements AlertsResponse {
  const factory _AlertsResponse({required final List<Alert> alerts}) =
      _$AlertsResponseImpl;

  factory _AlertsResponse.fromJson(Map<String, dynamic> json) =
      _$AlertsResponseImpl.fromJson;

  @override
  List<Alert> get alerts;

  /// Create a copy of AlertsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertsResponseImplCopyWith<_$AlertsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
