import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required int id,
    required String title,
    required String description,
    @JsonKey(name: 'event_date') required DateTime eventDate,
    required String location,
    User? creator,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class EventsResponse with _$EventsResponse {
  const factory EventsResponse({
    required List<Event> events,
    required Pagination pagination,
  }) = _EventsResponse;

  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);
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
