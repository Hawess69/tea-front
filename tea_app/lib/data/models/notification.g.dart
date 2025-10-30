// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDataImpl _$$NotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataImpl(
      alertId: (json['alert_id'] as num?)?.toInt(),
      postId: (json['post_id'] as num?)?.toInt(),
      nameMatched: json['name_matched'] as String?,
    );

Map<String, dynamic> _$$NotificationDataImplToJson(
        _$NotificationDataImpl instance) =>
    <String, dynamic>{
      'alert_id': instance.alertId,
      'post_id': instance.postId,
      'name_matched': instance.nameMatched,
    };

_$AppNotificationImpl _$$AppNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppNotificationImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      data: NotificationData.fromJson(json['data'] as Map<String, dynamic>),
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AppNotificationImplToJson(
        _$AppNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'data': instance.data,
      'read_at': instance.readAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$NotificationsResponseImpl _$$NotificationsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationsResponseImpl(
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationsResponseImplToJson(
        _$NotificationsResponseImpl instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
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
