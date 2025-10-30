import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationData with _$NotificationData {
  const factory NotificationData({
    @JsonKey(name: 'alert_id') int? alertId,
    @JsonKey(name: 'post_id') int? postId,
    @JsonKey(name: 'name_matched') String? nameMatched,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required int id,
    required String type,
    required NotificationData data,
    @JsonKey(name: 'read_at') DateTime? readAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

@freezed
class NotificationsResponse with _$NotificationsResponse {
  const factory NotificationsResponse({
    required List<AppNotification> notifications,
    required Pagination pagination,
  }) = _NotificationsResponse;

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);
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
