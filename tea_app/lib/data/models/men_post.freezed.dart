// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'men_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlagCounts _$FlagCountsFromJson(Map<String, dynamic> json) {
  return _FlagCounts.fromJson(json);
}

/// @nodoc
mixin _$FlagCounts {
  int get red => throw _privateConstructorUsedError;
  int get green => throw _privateConstructorUsedError;
  int get neutral => throw _privateConstructorUsedError;

  /// Serializes this FlagCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlagCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlagCountsCopyWith<FlagCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlagCountsCopyWith<$Res> {
  factory $FlagCountsCopyWith(
          FlagCounts value, $Res Function(FlagCounts) then) =
      _$FlagCountsCopyWithImpl<$Res, FlagCounts>;
  @useResult
  $Res call({int red, int green, int neutral});
}

/// @nodoc
class _$FlagCountsCopyWithImpl<$Res, $Val extends FlagCounts>
    implements $FlagCountsCopyWith<$Res> {
  _$FlagCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlagCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? red = null,
    Object? green = null,
    Object? neutral = null,
  }) {
    return _then(_value.copyWith(
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      neutral: null == neutral
          ? _value.neutral
          : neutral // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlagCountsImplCopyWith<$Res>
    implements $FlagCountsCopyWith<$Res> {
  factory _$$FlagCountsImplCopyWith(
          _$FlagCountsImpl value, $Res Function(_$FlagCountsImpl) then) =
      __$$FlagCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int red, int green, int neutral});
}

/// @nodoc
class __$$FlagCountsImplCopyWithImpl<$Res>
    extends _$FlagCountsCopyWithImpl<$Res, _$FlagCountsImpl>
    implements _$$FlagCountsImplCopyWith<$Res> {
  __$$FlagCountsImplCopyWithImpl(
      _$FlagCountsImpl _value, $Res Function(_$FlagCountsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlagCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? red = null,
    Object? green = null,
    Object? neutral = null,
  }) {
    return _then(_$FlagCountsImpl(
      red: null == red
          ? _value.red
          : red // ignore: cast_nullable_to_non_nullable
              as int,
      green: null == green
          ? _value.green
          : green // ignore: cast_nullable_to_non_nullable
              as int,
      neutral: null == neutral
          ? _value.neutral
          : neutral // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlagCountsImpl implements _FlagCounts {
  const _$FlagCountsImpl(
      {required this.red, required this.green, required this.neutral});

  factory _$FlagCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlagCountsImplFromJson(json);

  @override
  final int red;
  @override
  final int green;
  @override
  final int neutral;

  @override
  String toString() {
    return 'FlagCounts(red: $red, green: $green, neutral: $neutral)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlagCountsImpl &&
            (identical(other.red, red) || other.red == red) &&
            (identical(other.green, green) || other.green == green) &&
            (identical(other.neutral, neutral) || other.neutral == neutral));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, red, green, neutral);

  /// Create a copy of FlagCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlagCountsImplCopyWith<_$FlagCountsImpl> get copyWith =>
      __$$FlagCountsImplCopyWithImpl<_$FlagCountsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlagCountsImplToJson(
      this,
    );
  }
}

abstract class _FlagCounts implements FlagCounts {
  const factory _FlagCounts(
      {required final int red,
      required final int green,
      required final int neutral}) = _$FlagCountsImpl;

  factory _FlagCounts.fromJson(Map<String, dynamic> json) =
      _$FlagCountsImpl.fromJson;

  @override
  int get red;
  @override
  int get green;
  @override
  int get neutral;

  /// Create a copy of FlagCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlagCountsImplCopyWith<_$FlagCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlagRatio _$FlagRatioFromJson(Map<String, dynamic> json) {
  return _FlagRatio.fromJson(json);
}

/// @nodoc
mixin _$FlagRatio {
  @JsonKey(name: 'red_ratio')
  double get redRatio => throw _privateConstructorUsedError;
  @JsonKey(name: 'green_ratio')
  double get greenRatio => throw _privateConstructorUsedError;
  @JsonKey(name: 'neutral_ratio')
  double get neutralRatio => throw _privateConstructorUsedError;

  /// Serializes this FlagRatio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlagRatio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlagRatioCopyWith<FlagRatio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlagRatioCopyWith<$Res> {
  factory $FlagRatioCopyWith(FlagRatio value, $Res Function(FlagRatio) then) =
      _$FlagRatioCopyWithImpl<$Res, FlagRatio>;
  @useResult
  $Res call(
      {@JsonKey(name: 'red_ratio') double redRatio,
      @JsonKey(name: 'green_ratio') double greenRatio,
      @JsonKey(name: 'neutral_ratio') double neutralRatio});
}

/// @nodoc
class _$FlagRatioCopyWithImpl<$Res, $Val extends FlagRatio>
    implements $FlagRatioCopyWith<$Res> {
  _$FlagRatioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlagRatio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redRatio = null,
    Object? greenRatio = null,
    Object? neutralRatio = null,
  }) {
    return _then(_value.copyWith(
      redRatio: null == redRatio
          ? _value.redRatio
          : redRatio // ignore: cast_nullable_to_non_nullable
              as double,
      greenRatio: null == greenRatio
          ? _value.greenRatio
          : greenRatio // ignore: cast_nullable_to_non_nullable
              as double,
      neutralRatio: null == neutralRatio
          ? _value.neutralRatio
          : neutralRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlagRatioImplCopyWith<$Res>
    implements $FlagRatioCopyWith<$Res> {
  factory _$$FlagRatioImplCopyWith(
          _$FlagRatioImpl value, $Res Function(_$FlagRatioImpl) then) =
      __$$FlagRatioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'red_ratio') double redRatio,
      @JsonKey(name: 'green_ratio') double greenRatio,
      @JsonKey(name: 'neutral_ratio') double neutralRatio});
}

/// @nodoc
class __$$FlagRatioImplCopyWithImpl<$Res>
    extends _$FlagRatioCopyWithImpl<$Res, _$FlagRatioImpl>
    implements _$$FlagRatioImplCopyWith<$Res> {
  __$$FlagRatioImplCopyWithImpl(
      _$FlagRatioImpl _value, $Res Function(_$FlagRatioImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlagRatio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redRatio = null,
    Object? greenRatio = null,
    Object? neutralRatio = null,
  }) {
    return _then(_$FlagRatioImpl(
      redRatio: null == redRatio
          ? _value.redRatio
          : redRatio // ignore: cast_nullable_to_non_nullable
              as double,
      greenRatio: null == greenRatio
          ? _value.greenRatio
          : greenRatio // ignore: cast_nullable_to_non_nullable
              as double,
      neutralRatio: null == neutralRatio
          ? _value.neutralRatio
          : neutralRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlagRatioImpl implements _FlagRatio {
  const _$FlagRatioImpl(
      {@JsonKey(name: 'red_ratio') required this.redRatio,
      @JsonKey(name: 'green_ratio') required this.greenRatio,
      @JsonKey(name: 'neutral_ratio') required this.neutralRatio});

  factory _$FlagRatioImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlagRatioImplFromJson(json);

  @override
  @JsonKey(name: 'red_ratio')
  final double redRatio;
  @override
  @JsonKey(name: 'green_ratio')
  final double greenRatio;
  @override
  @JsonKey(name: 'neutral_ratio')
  final double neutralRatio;

  @override
  String toString() {
    return 'FlagRatio(redRatio: $redRatio, greenRatio: $greenRatio, neutralRatio: $neutralRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlagRatioImpl &&
            (identical(other.redRatio, redRatio) ||
                other.redRatio == redRatio) &&
            (identical(other.greenRatio, greenRatio) ||
                other.greenRatio == greenRatio) &&
            (identical(other.neutralRatio, neutralRatio) ||
                other.neutralRatio == neutralRatio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, redRatio, greenRatio, neutralRatio);

  /// Create a copy of FlagRatio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlagRatioImplCopyWith<_$FlagRatioImpl> get copyWith =>
      __$$FlagRatioImplCopyWithImpl<_$FlagRatioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlagRatioImplToJson(
      this,
    );
  }
}

abstract class _FlagRatio implements FlagRatio {
  const factory _FlagRatio(
          {@JsonKey(name: 'red_ratio') required final double redRatio,
          @JsonKey(name: 'green_ratio') required final double greenRatio,
          @JsonKey(name: 'neutral_ratio') required final double neutralRatio}) =
      _$FlagRatioImpl;

  factory _FlagRatio.fromJson(Map<String, dynamic> json) =
      _$FlagRatioImpl.fromJson;

  @override
  @JsonKey(name: 'red_ratio')
  double get redRatio;
  @override
  @JsonKey(name: 'green_ratio')
  double get greenRatio;
  @override
  @JsonKey(name: 'neutral_ratio')
  double get neutralRatio;

  /// Create a copy of FlagRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlagRatioImplCopyWith<_$FlagRatioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenPost _$MenPostFromJson(Map<String, dynamic> json) {
  return _MenPost.fromJson(json);
}

/// @nodoc
mixin _$MenPost {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag_counts')
  FlagCounts? get flagCounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_flags')
  int? get totalFlags => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag_ratio')
  FlagRatio? get flagRatio => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MenPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenPostCopyWith<MenPost> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenPostCopyWith<$Res> {
  factory $MenPostCopyWith(MenPost value, $Res Function(MenPost) then) =
      _$MenPostCopyWithImpl<$Res, MenPost>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String city,
      List<String>? tags,
      String caption,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'flag_counts') FlagCounts? flagCounts,
      @JsonKey(name: 'total_flags') int? totalFlags,
      @JsonKey(name: 'flag_ratio') FlagRatio? flagRatio,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $FlagCountsCopyWith<$Res>? get flagCounts;
  $FlagRatioCopyWith<$Res>? get flagRatio;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$MenPostCopyWithImpl<$Res, $Val extends MenPost>
    implements $MenPostCopyWith<$Res> {
  _$MenPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? city = null,
    Object? tags = freezed,
    Object? caption = null,
    Object? photoUrl = freezed,
    Object? flagCounts = freezed,
    Object? totalFlags = freezed,
    Object? flagRatio = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCounts: freezed == flagCounts
          ? _value.flagCounts
          : flagCounts // ignore: cast_nullable_to_non_nullable
              as FlagCounts?,
      totalFlags: freezed == totalFlags
          ? _value.totalFlags
          : totalFlags // ignore: cast_nullable_to_non_nullable
              as int?,
      flagRatio: freezed == flagRatio
          ? _value.flagRatio
          : flagRatio // ignore: cast_nullable_to_non_nullable
              as FlagRatio?,
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

  /// Create a copy of MenPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlagCountsCopyWith<$Res>? get flagCounts {
    if (_value.flagCounts == null) {
      return null;
    }

    return $FlagCountsCopyWith<$Res>(_value.flagCounts!, (value) {
      return _then(_value.copyWith(flagCounts: value) as $Val);
    });
  }

  /// Create a copy of MenPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlagRatioCopyWith<$Res>? get flagRatio {
    if (_value.flagRatio == null) {
      return null;
    }

    return $FlagRatioCopyWith<$Res>(_value.flagRatio!, (value) {
      return _then(_value.copyWith(flagRatio: value) as $Val);
    });
  }

  /// Create a copy of MenPost
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
abstract class _$$MenPostImplCopyWith<$Res> implements $MenPostCopyWith<$Res> {
  factory _$$MenPostImplCopyWith(
          _$MenPostImpl value, $Res Function(_$MenPostImpl) then) =
      __$$MenPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String city,
      List<String>? tags,
      String caption,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'flag_counts') FlagCounts? flagCounts,
      @JsonKey(name: 'total_flags') int? totalFlags,
      @JsonKey(name: 'flag_ratio') FlagRatio? flagRatio,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $FlagCountsCopyWith<$Res>? get flagCounts;
  @override
  $FlagRatioCopyWith<$Res>? get flagRatio;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$MenPostImplCopyWithImpl<$Res>
    extends _$MenPostCopyWithImpl<$Res, _$MenPostImpl>
    implements _$$MenPostImplCopyWith<$Res> {
  __$$MenPostImplCopyWithImpl(
      _$MenPostImpl _value, $Res Function(_$MenPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? city = null,
    Object? tags = freezed,
    Object? caption = null,
    Object? photoUrl = freezed,
    Object? flagCounts = freezed,
    Object? totalFlags = freezed,
    Object? flagRatio = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MenPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCounts: freezed == flagCounts
          ? _value.flagCounts
          : flagCounts // ignore: cast_nullable_to_non_nullable
              as FlagCounts?,
      totalFlags: freezed == totalFlags
          ? _value.totalFlags
          : totalFlags // ignore: cast_nullable_to_non_nullable
              as int?,
      flagRatio: freezed == flagRatio
          ? _value.flagRatio
          : flagRatio // ignore: cast_nullable_to_non_nullable
              as FlagRatio?,
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
class _$MenPostImpl implements _MenPost {
  const _$MenPostImpl(
      {required this.id,
      @JsonKey(name: 'full_name') required this.fullName,
      required this.city,
      final List<String>? tags,
      required this.caption,
      @JsonKey(name: 'photo_url') this.photoUrl,
      @JsonKey(name: 'flag_counts') this.flagCounts,
      @JsonKey(name: 'total_flags') this.totalFlags,
      @JsonKey(name: 'flag_ratio') this.flagRatio,
      this.user,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _tags = tags;

  factory _$MenPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenPostImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String city;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String caption;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  @JsonKey(name: 'flag_counts')
  final FlagCounts? flagCounts;
  @override
  @JsonKey(name: 'total_flags')
  final int? totalFlags;
  @override
  @JsonKey(name: 'flag_ratio')
  final FlagRatio? flagRatio;
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
    return 'MenPost(id: $id, fullName: $fullName, city: $city, tags: $tags, caption: $caption, photoUrl: $photoUrl, flagCounts: $flagCounts, totalFlags: $totalFlags, flagRatio: $flagRatio, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.flagCounts, flagCounts) ||
                other.flagCounts == flagCounts) &&
            (identical(other.totalFlags, totalFlags) ||
                other.totalFlags == totalFlags) &&
            (identical(other.flagRatio, flagRatio) ||
                other.flagRatio == flagRatio) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      city,
      const DeepCollectionEquality().hash(_tags),
      caption,
      photoUrl,
      flagCounts,
      totalFlags,
      flagRatio,
      user,
      createdAt,
      updatedAt);

  /// Create a copy of MenPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenPostImplCopyWith<_$MenPostImpl> get copyWith =>
      __$$MenPostImplCopyWithImpl<_$MenPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenPostImplToJson(
      this,
    );
  }
}

abstract class _MenPost implements MenPost {
  const factory _MenPost(
      {required final int id,
      @JsonKey(name: 'full_name') required final String fullName,
      required final String city,
      final List<String>? tags,
      required final String caption,
      @JsonKey(name: 'photo_url') final String? photoUrl,
      @JsonKey(name: 'flag_counts') final FlagCounts? flagCounts,
      @JsonKey(name: 'total_flags') final int? totalFlags,
      @JsonKey(name: 'flag_ratio') final FlagRatio? flagRatio,
      final User? user,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$MenPostImpl;

  factory _MenPost.fromJson(Map<String, dynamic> json) = _$MenPostImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get city;
  @override
  List<String>? get tags;
  @override
  String get caption;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  @JsonKey(name: 'flag_counts')
  FlagCounts? get flagCounts;
  @override
  @JsonKey(name: 'total_flags')
  int? get totalFlags;
  @override
  @JsonKey(name: 'flag_ratio')
  FlagRatio? get flagRatio;
  @override
  User? get user;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of MenPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenPostImplCopyWith<_$MenPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenPostsResponse _$MenPostsResponseFromJson(Map<String, dynamic> json) {
  return _MenPostsResponse.fromJson(json);
}

/// @nodoc
mixin _$MenPostsResponse {
  List<MenPost> get posts => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this MenPostsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenPostsResponseCopyWith<MenPostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenPostsResponseCopyWith<$Res> {
  factory $MenPostsResponseCopyWith(
          MenPostsResponse value, $Res Function(MenPostsResponse) then) =
      _$MenPostsResponseCopyWithImpl<$Res, MenPostsResponse>;
  @useResult
  $Res call({List<MenPost> posts, Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$MenPostsResponseCopyWithImpl<$Res, $Val extends MenPostsResponse>
    implements $MenPostsResponseCopyWith<$Res> {
  _$MenPostsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<MenPost>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  /// Create a copy of MenPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenPostsResponseImplCopyWith<$Res>
    implements $MenPostsResponseCopyWith<$Res> {
  factory _$$MenPostsResponseImplCopyWith(_$MenPostsResponseImpl value,
          $Res Function(_$MenPostsResponseImpl) then) =
      __$$MenPostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenPost> posts, Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$MenPostsResponseImplCopyWithImpl<$Res>
    extends _$MenPostsResponseCopyWithImpl<$Res, _$MenPostsResponseImpl>
    implements _$$MenPostsResponseImplCopyWith<$Res> {
  __$$MenPostsResponseImplCopyWithImpl(_$MenPostsResponseImpl _value,
      $Res Function(_$MenPostsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? pagination = null,
  }) {
    return _then(_$MenPostsResponseImpl(
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<MenPost>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenPostsResponseImpl implements _MenPostsResponse {
  const _$MenPostsResponseImpl(
      {required final List<MenPost> posts, required this.pagination})
      : _posts = posts;

  factory _$MenPostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenPostsResponseImplFromJson(json);

  final List<MenPost> _posts;
  @override
  List<MenPost> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'MenPostsResponse(posts: $posts, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenPostsResponseImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), pagination);

  /// Create a copy of MenPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenPostsResponseImplCopyWith<_$MenPostsResponseImpl> get copyWith =>
      __$$MenPostsResponseImplCopyWithImpl<_$MenPostsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenPostsResponseImplToJson(
      this,
    );
  }
}

abstract class _MenPostsResponse implements MenPostsResponse {
  const factory _MenPostsResponse(
      {required final List<MenPost> posts,
      required final Pagination pagination}) = _$MenPostsResponseImpl;

  factory _MenPostsResponse.fromJson(Map<String, dynamic> json) =
      _$MenPostsResponseImpl.fromJson;

  @override
  List<MenPost> get posts;
  @override
  Pagination get pagination;

  /// Create a copy of MenPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenPostsResponseImplCopyWith<_$MenPostsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationImpl>
    implements _$$PaginationImplCopyWith<$Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl _value, $Res Function(_$PaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_$PaginationImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {@JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'last_page') required this.lastPage,
      @JsonKey(name: 'per_page') required this.perPage,
      required this.total});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  final int total;

  @override
  String toString() {
    return 'Pagination(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      __$$PaginationImplCopyWithImpl<_$PaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination(
      {@JsonKey(name: 'current_page') required final int currentPage,
      @JsonKey(name: 'last_page') required final int lastPage,
      @JsonKey(name: 'per_page') required final int perPage,
      required final int total}) = _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get total;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
