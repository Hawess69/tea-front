import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/user.dart';
import '../../../core/constants/app_strings.dart';
import '../../providers/auth_provider.dart';
import '../../providers/repositories_provider.dart';

final profileProvider = FutureProvider.autoDispose<User>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);
  return await repository.getProfile();
});

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/profile/edit'),
          ),
        ],
      ),
      body: profileAsync.when(
        data: (user) => SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Avatar
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
              // Name
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Name'),
                subtitle: Text(user.name),
              ),
              const Divider(),
              // Email
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text(user.email),
              ),
              const Divider(),
              // Phone
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                subtitle: Text(user.phone ?? 'Not provided'),
              ),
              const SizedBox(height: 24),
              // Logout button
              ElevatedButton.icon(
                onPressed: () async {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                  if (shouldLogout == true && context.mounted) {
                    await ref.read(authStateProvider.notifier).logout();
                    if (context.mounted) {
                      context.go('/login');
                    }
                  }
                },
                icon: const Icon(Icons.logout),
                label: const Text(AppStrings.logout),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error loading profile'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.invalidate(profileProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

