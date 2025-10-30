import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/user.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/services/api_client.dart';
import '../../data/services/storage_service.dart';
part 'auth_provider.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final storageService = ref.watch(storageServiceProvider);
  return ApiClient(storageService);
}

@riverpod
StorageService storageService(StorageServiceRef ref) {
  return StorageService();
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return AuthRepository(apiClient, storageService);
}

@riverpod
class AuthState extends _$AuthState {
  @override
  Future<User?> build() async {
    final authRepository = ref.watch(authRepositoryProvider);
    return await authRepository.getCurrentUser();
  }

  Future<void> login(String email, String password) async {
    final authRepository = ref.watch(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.login(
          email: email,
          password: password,
        ).then((response) => response.user));
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    final authRepository = ref.watch(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.register(
          name: name,
          email: email,
          password: password,
          phone: phone,
        ).then((response) => response.user));
  }

  Future<void> logout() async {
    final authRepository = ref.watch(authRepositoryProvider);
    await authRepository.logout();
    state = const AsyncValue.data(null);
  }
}



