// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedPost _$FeedPostFromJson(Map<String, dynamic> json) {
  return _FeedPost.fromJson(json);
}

/// @nodoc
mixin _$FeedPost {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get upvotes => throw _privateConstructorUsedError;
  int? get downvotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count')
  int? get commentsCount => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<dynamic>? get votes =>
      throw _privateConstructorUsedError; // User's vote data
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FeedPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedPostCopyWith<FeedPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedPostCopyWith<$Res> {
  factory $FeedPostCopyWith(FeedPost value, $Res Function(FeedPost) then) =
      _$FeedPostCopyWithImpl<$Res, FeedPost>;
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      @JsonKey(name: 'image_url') String? imageUrl,
      int? upvotes,
      int? downvotes,
      @JsonKey(name: 'comments_count') int? commentsCount,
      int? score,
      User? user,
      List<dynamic>? votes,
      List<Comment>? comments,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$FeedPostCopyWithImpl<$Res, $Val extends FeedPost>
    implements $FeedPostCopyWith<$Res> {
  _$FeedPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? imageUrl = freezed,
    Object? upvotes = freezed,
    Object? downvotes = freezed,
    Object? commentsCount = freezed,
    Object? score = freezed,
    Object? user = freezed,
    Object? votes = freezed,
    Object? comments = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      upvotes: freezed == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int?,
      downvotes: freezed == downvotes
          ? _value.downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      votes: freezed == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
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

  /// Create a copy of FeedPost
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
abstract class _$$FeedPostImplCopyWith<$Res>
    implements $FeedPostCopyWith<$Res> {
  factory _$$FeedPostImplCopyWith(
          _$FeedPostImpl value, $Res Function(_$FeedPostImpl) then) =
      __$$FeedPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      @JsonKey(name: 'image_url') String? imageUrl,
      int? upvotes,
      int? downvotes,
      @JsonKey(name: 'comments_count') int? commentsCount,
      int? score,
      User? user,
      List<dynamic>? votes,
      List<Comment>? comments,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$FeedPostImplCopyWithImpl<$Res>
    extends _$FeedPostCopyWithImpl<$Res, _$FeedPostImpl>
    implements _$$FeedPostImplCopyWith<$Res> {
  __$$FeedPostImplCopyWithImpl(
      _$FeedPostImpl _value, $Res Function(_$FeedPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? imageUrl = freezed,
    Object? upvotes = freezed,
    Object? downvotes = freezed,
    Object? commentsCount = freezed,
    Object? score = freezed,
    Object? user = freezed,
    Object? votes = freezed,
    Object? comments = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FeedPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      upvotes: freezed == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int?,
      downvotes: freezed == downvotes
          ? _value.downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      votes: freezed == votes
          ? _value._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
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
class _$FeedPostImpl implements _FeedPost {
  const _$FeedPostImpl(
      {required this.id,
      required this.title,
      required this.body,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.upvotes,
      this.downvotes,
      @JsonKey(name: 'comments_count') this.commentsCount,
      this.score,
      this.user,
      final List<dynamic>? votes,
      final List<Comment>? comments,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _votes = votes,
        _comments = comments;

  factory _$FeedPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedPostImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final int? upvotes;
  @override
  final int? downvotes;
  @override
  @JsonKey(name: 'comments_count')
  final int? commentsCount;
  @override
  final int? score;
  @override
  final User? user;
  final List<dynamic>? _votes;
  @override
  List<dynamic>? get votes {
    final value = _votes;
    if (value == null) return null;
    if (_votes is EqualUnmodifiableListView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// User's vote data
  final List<Comment>? _comments;
// User's vote data
  @override
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'FeedPost(id: $id, title: $title, body: $body, imageUrl: $imageUrl, upvotes: $upvotes, downvotes: $downvotes, commentsCount: $commentsCount, score: $score, user: $user, votes: $votes, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.upvotes, upvotes) || other.upvotes == upvotes) &&
            (identical(other.downvotes, downvotes) ||
                other.downvotes == downvotes) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._votes, _votes) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
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
      title,
      body,
      imageUrl,
      upvotes,
      downvotes,
      commentsCount,
      score,
      user,
      const DeepCollectionEquality().hash(_votes),
      const DeepCollectionEquality().hash(_comments),
      createdAt,
      updatedAt);

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPostImplCopyWith<_$FeedPostImpl> get copyWith =>
      __$$FeedPostImplCopyWithImpl<_$FeedPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedPostImplToJson(
      this,
    );
  }
}

abstract class _FeedPost implements FeedPost {
  const factory _FeedPost(
      {required final int id,
      required final String title,
      required final String body,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final int? upvotes,
      final int? downvotes,
      @JsonKey(name: 'comments_count') final int? commentsCount,
      final int? score,
      final User? user,
      final List<dynamic>? votes,
      final List<Comment>? comments,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$FeedPostImpl;

  factory _FeedPost.fromJson(Map<String, dynamic> json) =
      _$FeedPostImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  int? get upvotes;
  @override
  int? get downvotes;
  @override
  @JsonKey(name: 'comments_count')
  int? get commentsCount;
  @override
  int? get score;
  @override
  User? get user;
  @override
  List<dynamic>? get votes; // User's vote data
  @override
  List<Comment>? get comments;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedPostImplCopyWith<_$FeedPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedPostsResponse _$FeedPostsResponseFromJson(Map<String, dynamic> json) {
  return _FeedPostsResponse.fromJson(json);
}

/// @nodoc
mixin _$FeedPostsResponse {
  List<FeedPost> get posts => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this FeedPostsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedPostsResponseCopyWith<FeedPostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedPostsResponseCopyWith<$Res> {
  factory $FeedPostsResponseCopyWith(
          FeedPostsResponse value, $Res Function(FeedPostsResponse) then) =
      _$FeedPostsResponseCopyWithImpl<$Res, FeedPostsResponse>;
  @useResult
  $Res call({List<FeedPost> posts, Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$FeedPostsResponseCopyWithImpl<$Res, $Val extends FeedPostsResponse>
    implements $FeedPostsResponseCopyWith<$Res> {
  _$FeedPostsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedPostsResponse
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
              as List<FeedPost>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  /// Create a copy of FeedPostsResponse
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
abstract class _$$FeedPostsResponseImplCopyWith<$Res>
    implements $FeedPostsResponseCopyWith<$Res> {
  factory _$$FeedPostsResponseImplCopyWith(_$FeedPostsResponseImpl value,
          $Res Function(_$FeedPostsResponseImpl) then) =
      __$$FeedPostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FeedPost> posts, Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$FeedPostsResponseImplCopyWithImpl<$Res>
    extends _$FeedPostsResponseCopyWithImpl<$Res, _$FeedPostsResponseImpl>
    implements _$$FeedPostsResponseImplCopyWith<$Res> {
  __$$FeedPostsResponseImplCopyWithImpl(_$FeedPostsResponseImpl _value,
      $Res Function(_$FeedPostsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? pagination = null,
  }) {
    return _then(_$FeedPostsResponseImpl(
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<FeedPost>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedPostsResponseImpl implements _FeedPostsResponse {
  const _$FeedPostsResponseImpl(
      {required final List<FeedPost> posts, required this.pagination})
      : _posts = posts;

  factory _$FeedPostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedPostsResponseImplFromJson(json);

  final List<FeedPost> _posts;
  @override
  List<FeedPost> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'FeedPostsResponse(posts: $posts, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPostsResponseImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), pagination);

  /// Create a copy of FeedPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPostsResponseImplCopyWith<_$FeedPostsResponseImpl> get copyWith =>
      __$$FeedPostsResponseImplCopyWithImpl<_$FeedPostsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedPostsResponseImplToJson(
      this,
    );
  }
}

abstract class _FeedPostsResponse implements FeedPostsResponse {
  const factory _FeedPostsResponse(
      {required final List<FeedPost> posts,
      required final Pagination pagination}) = _$FeedPostsResponseImpl;

  factory _FeedPostsResponse.fromJson(Map<String, dynamic> json) =
      _$FeedPostsResponseImpl.fromJson;

  @override
  List<FeedPost> get posts;
  @override
  Pagination get pagination;

  /// Create a copy of FeedPostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedPostsResponseImplCopyWith<_$FeedPostsResponseImpl> get copyWith =>
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
