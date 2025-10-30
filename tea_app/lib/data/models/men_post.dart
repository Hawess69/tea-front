import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'men_post.freezed.dart';
part 'men_post.g.dart';

@freezed
class FlagCounts with _$FlagCounts {
  const factory FlagCounts({
    required int red,
    required int green,
    required int neutral,
  }) = _FlagCounts;

  factory FlagCounts.fromJson(Map<String, dynamic> json) =>
      _$FlagCountsFromJson(json);
}

@freezed
class FlagRatio with _$FlagRatio {
  const factory FlagRatio({
    @JsonKey(name: 'red_ratio') required double redRatio,
    @JsonKey(name: 'green_ratio') required double greenRatio,
    @JsonKey(name: 'neutral_ratio') required double neutralRatio,
  }) = _FlagRatio;

  factory FlagRatio.fromJson(Map<String, dynamic> json) =>
      _$FlagRatioFromJson(json);
}

@freezed
class MenPost with _$MenPost {
  const factory MenPost({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    required String city,
    List<String>? tags,
    required String caption,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'flag_counts') FlagCounts? flagCounts,
    @JsonKey(name: 'total_flags') int? totalFlags,
    @JsonKey(name: 'flag_ratio') FlagRatio? flagRatio,
    User? user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _MenPost;

  factory MenPost.fromJson(Map<String, dynamic> json) =>
      _$MenPostFromJson(json);
}

@freezed
class MenPostsResponse with _$MenPostsResponse {
  const factory MenPostsResponse({
    required List<MenPost> posts,
    required Pagination pagination,
  }) = _MenPostsResponse;

  factory MenPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$MenPostsResponseFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'per_page') required int perPage,
    required int total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

