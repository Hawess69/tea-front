import '../models/alert.dart';
import '../services/api_client.dart';

class AlertsRepository {
  final ApiClient _apiClient;

  AlertsRepository(this._apiClient);

  Future<List<Alert>> getAlerts() async {
    try {
      final response = await _apiClient.getAlerts();
      final data = response.data as Map<String, dynamic>;
      final alertsList = data['alerts'] as List<dynamic>;
      return alertsList.map((json) => Alert.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get alerts: ${e.toString()}');
    }
  }

  Future<Alert> createAlert(String nameToTrack) async {
    try {
      final response = await _apiClient.createAlert(nameToTrack);
      final data = response.data as Map<String, dynamic>;
      return Alert.fromJson(data['alert']);
    } catch (e) {
      throw Exception('Failed to create alert: ${e.toString()}');
    }
  }

  Future<void> deleteAlert(int id) async {
    try {
      await _apiClient.deleteAlert(id);
    } catch (e) {
      throw Exception('Failed to delete alert: ${e.toString()}');
    }
  }
}
