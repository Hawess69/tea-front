import 'package:tea_app/data/services/storage_interface.dart';

/// Mock storage service for testing
/// Uses in-memory storage instead of platform-specific implementations
/// This class provides the same interface as StorageService but without platform dependencies
class MockStorageService implements StorageInterface {
  final Map<String, dynamic> _storage = {};
  final Map<String, String> _secureStorage = {};

  static const String _authTokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';

  // Auth token storage
  Future<void> saveAuthToken(String token) async {
    _secureStorage[_authTokenKey] = token;
  }

  Future<String?> getAuthToken() async {
    return _secureStorage[_authTokenKey];
  }

  Future<void> clearAuthToken() async {
    _secureStorage.remove(_authTokenKey);
  }

  // User ID storage
  Future<void> saveUserId(int userId) async {
    _storage[_userIdKey] = userId;
  }

  Future<int?> getUserId() async {
    return _storage[_userIdKey];
  }

  // Generic storage methods
  Future<void> saveString(String key, String value) async {
    _storage[key] = value;
  }

  Future<String?> getString(String key) async {
    return _storage[key];
  }

  Future<void> saveInt(String key, int value) async {
    _storage[key] = value;
  }

  Future<int?> getInt(String key) async {
    return _storage[key];
  }

  Future<void> remove(String key) async {
    _storage.remove(key);
  }

  Future<void> clearAll() async {
    _storage.clear();
    _secureStorage.clear();
  }

  /// Clear all stored data (for test cleanup)
  void reset() {
    _storage.clear();
    _secureStorage.clear();
  }
}

