import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/profile_repository.dart';
import '../../providers/repositories_provider.dart';
import '../../../core/constants/app_strings.dart';

final editProfileProvider =
    StateNotifierProvider.autoDispose<EditProfileNotifier, AsyncValue<User>>(
        (ref) => EditProfileNotifier(ref.watch(profileRepositoryProvider)));

class EditProfileNotifier extends StateNotifier<AsyncValue<User>> {
  final ProfileRepository _repository;

  EditProfileNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> loadProfile() async {
    try {
      final user = await _repository.getProfile();
      state = AsyncValue.data(user);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> updateProfile({
    String? name,
    String? phone,
    String? avatar,
  }) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repository.updateProfile(
        name: name,
        phone: phone,
        avatar: avatar,
      );
      state = AsyncValue.data(user);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  String? _avatar;

  @override
  void initState() {
    super.initState();
    _loadProfile();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  void _loadProfile() async {
    await ref.read(editProfileProvider.notifier).loadProfile();
    final profile = ref.read(editProfileProvider).value;
    if (profile != null) {
      _nameController.text = profile.name;
      _phoneController.text = profile.phone ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(editProfileProvider.notifier).updateProfile(
            name: _nameController.text.trim(),
            phone: _phoneController.text.trim().isEmpty
                ? null
                : _phoneController.text.trim(),
            avatar: _avatar,
          );
      if (mounted) {
        if (ref.read(editProfileProvider).hasValue) {
          context.pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update profile')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncProfile = ref.watch(editProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: asyncProfile.when(
        data: (user) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Avatar section
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Name field
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      if (value.length < 2 || value.length > 100) {
                        return 'Name must be between 2 and 100 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Phone field
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone (optional)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length > 20) {
                        return 'Phone must be less than 20 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  // Save button
                  ElevatedButton(
                    onPressed: _saveProfile,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: ${error.toString()}'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.invalidate(editProfileProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

