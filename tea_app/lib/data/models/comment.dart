import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required String body,
    @JsonKey(name: 'post_type') String? postType,
    User? user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class CommentsResponse with _$CommentsResponse {
  const factory CommentsResponse({
    required List<Comment> comments,
    Pagination? pagination,
  }) = _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
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

