// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedPostImpl _$$FeedPostImplFromJson(Map<String, dynamic> json) =>
    _$FeedPostImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      imageUrl: json['image_url'] as String?,
      upvotes: (json['upvotes'] as num?)?.toInt(),
      downvotes: (json['downvotes'] as num?)?.toInt(),
      commentsCount: (json['comments_count'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      votes: json['votes'] as List<dynamic>?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$FeedPostImplToJson(_$FeedPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'image_url': instance.imageUrl,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'comments_count': instance.commentsCount,
      'score': instance.score,
      'user': instance.user,
      'votes': instance.votes,
      'comments': instance.comments,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$FeedPostsResponseImpl _$$FeedPostsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedPostsResponseImpl(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => FeedPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedPostsResponseImplToJson(
        _$FeedPostsResponseImpl instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'pagination': instance.pagination,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      currentPage: (json['current_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
