import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

@freezed
class Alert with _$Alert {
  const factory Alert({
    required int id,
    @JsonKey(name: 'name_to_track') required String nameToTrack,
    @JsonKey(name: 'is_active') required bool isActive,
    User? user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}

@freezed
class AlertsResponse with _$AlertsResponse {
  const factory AlertsResponse({
    required List<Alert> alerts,
  }) = _AlertsResponse;

  factory AlertsResponse.fromJson(Map<String, dynamic> json) =>
      _$AlertsResponseFromJson(json);
}
