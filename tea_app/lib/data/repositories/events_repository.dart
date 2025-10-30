import '../models/event.dart';
import '../services/api_client.dart';

class EventsRepository {
  final ApiClient _apiClient;

  EventsRepository(this._apiClient);

  Future<EventsResponse> getEvents({
    int page = 1,
    int perPage = 20,
    bool upcoming = true,
  }) async {
    try {
      final response = await _apiClient.getEvents(
        page: page,
        perPage: perPage,
        upcoming: upcoming,
      );
      return EventsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get events: ${e.toString()}');
    }
  }
}
