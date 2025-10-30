import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';
import 'comment.dart';

part 'feed_post.freezed.dart';
part 'feed_post.g.dart';

@freezed
class FeedPost with _$FeedPost {
  const factory FeedPost({
    required int id,
    required String title,
    required String body,
    @JsonKey(name: 'image_url') String? imageUrl,
    int? upvotes,
    int? downvotes,
    @JsonKey(name: 'comments_count') int? commentsCount,
    int? score,
    User? user,
    List<dynamic>? votes, // User's vote data
    List<Comment>? comments,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _FeedPost;

  factory FeedPost.fromJson(Map<String, dynamic> json) =>
      _$FeedPostFromJson(json);
}

// Pagination wrapper
@freezed
class FeedPostsResponse with _$FeedPostsResponse {
  const factory FeedPostsResponse({
    required List<FeedPost> posts,
    required Pagination pagination,
  }) = _FeedPostsResponse;

  factory FeedPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedPostsResponseFromJson(json);
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

