import '../models/notification.dart';
import '../services/api_client.dart';

class NotificationsRepository {
  final ApiClient _apiClient;

  NotificationsRepository(this._apiClient);

  Future<NotificationsResponse> getNotifications({
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final response = await _apiClient.getNotifications(
        page: page,
        perPage: perPage,
      );
      return NotificationsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get notifications: ${e.toString()}');
    }
  }
}
