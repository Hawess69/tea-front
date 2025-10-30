/// Abstract interface for storage operations
/// Implemented by both StorageService and MockStorageService
abstract class StorageInterface {
  Future<void> saveAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> clearAuthToken();
  Future<void> saveUserId(int userId);
  Future<int?> getUserId();
  Future<void> saveString(String key, String value);
  Future<String?> getString(String key);
  Future<void> saveInt(String key, int value);
  Future<int?> getInt(String key);
  Future<void> remove(String key);
  Future<void> clearAll();
}

