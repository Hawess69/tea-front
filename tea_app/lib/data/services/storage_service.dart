import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'storage_interface.dart';

class StorageService implements StorageInterface {
  static const _secureStorage = FlutterSecureStorage();
  static const String _authTokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';
  static const String _boxName = 'tea_app';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  // Auth token storage
  Future<void> saveAuthToken(String token) async {
    await _secureStorage.write(key: _authTokenKey, value: token);
  }

  Future<String?> getAuthToken() async {
    return await _secureStorage.read(key: _authTokenKey);
  }

  Future<void> clearAuthToken() async {
    await _secureStorage.delete(key: _authTokenKey);
  }

  // User ID storage
  Future<void> saveUserId(int userId) async {
    final box = Hive.box(_boxName);
    await box.put(_userIdKey, userId);
  }

  Future<int?> getUserId() async {
    final box = Hive.box(_boxName);
    return box.get(_userIdKey);
  }

  // Generic storage methods
  Future<void> saveString(String key, String value) async {
    final box = Hive.box(_boxName);
    await box.put(key, value);
  }

  Future<String?> getString(String key) async {
    final box = Hive.box(_boxName);
    return box.get(key);
  }

  Future<void> saveInt(String key, int value) async {
    final box = Hive.box(_boxName);
    await box.put(key, value);
  }

  Future<int?> getInt(String key) async {
    final box = Hive.box(_boxName);
    return box.get(key);
  }

  Future<void> remove(String key) async {
    final box = Hive.box(_boxName);
    await box.delete(key);
  }

  Future<void> clearAll() async {
    final box = Hive.box(_boxName);
    await box.clear();
  }
}

