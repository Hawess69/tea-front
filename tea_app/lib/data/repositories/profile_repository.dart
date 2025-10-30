import '../models/user.dart';
import '../services/api_client.dart';

class ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepository(this._apiClient);

  Future<User> getProfile() async {
    try {
      final response = await _apiClient.getProfile();
      final data = response.data as Map<String, dynamic>;
      return User.fromJson(data['user']);
    } catch (e) {
      throw Exception('Failed to get profile: ${e.toString()}');
    }
  }

  Future<User> updateProfile({
    String? name,
    String? phone,
    String? avatar,
  }) async {
    try {
      final response = await _apiClient.updateProfile(
        name: name,
        phone: phone,
        avatar: avatar,
      );
      final data = response.data as Map<String, dynamic>;
      return User.fromJson(data['user']);
    } catch (e) {
      throw Exception('Failed to update profile: ${e.toString()}');
    }
  }
}

