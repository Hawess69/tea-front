import '../models/user.dart';
import '../services/api_client.dart';
import '../services/storage_service.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final StorageService _storageService;

  AuthRepository(this._apiClient, this._storageService);

  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final response = await _apiClient.register({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        if (phone != null) 'phone': phone,
      });

      final data = response.data as Map<String, dynamic>;
      final user = User.fromJson(data['user']);
      final token = data['token'] as String;

      await _storageService.saveAuthToken(token);
      await _storageService.saveUserId(user.id);

      return AuthResponse(
        user: user,
        token: token,
        message: data['message'] as String?,
      );
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.login({
        'email': email,
        'password': password,
      });

      final data = response.data as Map<String, dynamic>;
      final user = User.fromJson(data['user']);
      final token = data['token'] as String;

      await _storageService.saveAuthToken(token);
      await _storageService.saveUserId(user.id);

      return AuthResponse(
        user: user,
        token: token,
        message: data['message'] as String?,
      );
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  Future<User> getProfile() async {
    try {
      final response = await _apiClient.getProfile();
      final data = response.data as Map<String, dynamic>;
      return User.fromJson(data['user']);
    } catch (e) {
      throw Exception('Failed to get profile: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    await _storageService.clearAuthToken();
  }

  Future<User?> getCurrentUser() async {
    final userId = await _storageService.getUserId();
    if (userId == null) return null;
    
    try {
      return await getProfile();
    } catch (e) {
      return null;
    }
  }
}

class AuthResponse {
  final User user;
  final String token;
  final String? message;

  AuthResponse({
    required this.user,
    required this.token,
    this.message,
  });
}

