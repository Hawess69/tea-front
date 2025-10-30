// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'men_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlagCountsImpl _$$FlagCountsImplFromJson(Map<String, dynamic> json) =>
    _$FlagCountsImpl(
      red: (json['red'] as num).toInt(),
      green: (json['green'] as num).toInt(),
      neutral: (json['neutral'] as num).toInt(),
    );

Map<String, dynamic> _$$FlagCountsImplToJson(_$FlagCountsImpl instance) =>
    <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'neutral': instance.neutral,
    };

_$FlagRatioImpl _$$FlagRatioImplFromJson(Map<String, dynamic> json) =>
    _$FlagRatioImpl(
      redRatio: (json['red_ratio'] as num).toDouble(),
      greenRatio: (json['green_ratio'] as num).toDouble(),
      neutralRatio: (json['neutral_ratio'] as num).toDouble(),
    );

Map<String, dynamic> _$$FlagRatioImplToJson(_$FlagRatioImpl instance) =>
    <String, dynamic>{
      'red_ratio': instance.redRatio,
      'green_ratio': instance.greenRatio,
      'neutral_ratio': instance.neutralRatio,
    };

_$MenPostImpl _$$MenPostImplFromJson(Map<String, dynamic> json) =>
    _$MenPostImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      city: json['city'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      caption: json['caption'] as String,
      photoUrl: json['photo_url'] as String?,
      flagCounts: json['flag_counts'] == null
          ? null
          : FlagCounts.fromJson(json['flag_counts'] as Map<String, dynamic>),
      totalFlags: (json['total_flags'] as num?)?.toInt(),
      flagRatio: json['flag_ratio'] == null
          ? null
          : FlagRatio.fromJson(json['flag_ratio'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$MenPostImplToJson(_$MenPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'city': instance.city,
      'tags': instance.tags,
      'caption': instance.caption,
      'photo_url': instance.photoUrl,
      'flag_counts': instance.flagCounts,
      'total_flags': instance.totalFlags,
      'flag_ratio': instance.flagRatio,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$MenPostsResponseImpl _$$MenPostsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MenPostsResponseImpl(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => MenPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MenPostsResponseImplToJson(
        _$MenPostsResponseImpl instance) =>
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
