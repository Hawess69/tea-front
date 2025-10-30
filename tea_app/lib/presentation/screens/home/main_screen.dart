import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../men_posts/men_posts_screen.dart';
import '../feed/feed_screen.dart';
import '../forum/forum_screen.dart';
import '../events/events_screen.dart';
import '../../widgets/navigation/custom_bottom_nav.dart';
import '../../../core/constants/app_colors.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final authState = ref.watch(authStateProvider);

    final screenTitles = [
      'Men Posts',
      'Feed',
      'Forum',
      'Events',
    ];

    final screens = [
      const MenPostsScreen(),
      const FeedScreen(),
      const ForumScreen(),
      const EventsScreen(),
    ];

    void showCreateBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Create New Post',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  _CreateOption(
                    icon: Icons.person_add_alt_1_outlined,
                    title: 'Post a Man',
                    subtitle: 'Share experiences about men',
                    onTap: () {
                      Navigator.pop(context);
                      context.push('/men-posts/create');
                    },
                  ),
                  const SizedBox(height: 12),
                  _CreateOption(
                    icon: Icons.article_outlined,
                    title: 'Create Feed Post',
                    subtitle: 'Share a community post',
                    onTap: () {
                      Navigator.pop(context);
                      context.push('/feed-posts/create');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(currentIndexProvider.notifier).state = index;
        },
        onFABPressed: () => showCreateBottomSheet(context),
      ),
      appBar: AppBar(
        title: Text(screenTitles[currentIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.push('/notifications'),
          ),
          PopupMenuButton(
            icon: CircleAvatar(
              backgroundColor: AppColors.primaryLight,
              child: Text(
                authState.value?.name[0] ?? '?',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Row(
                  children: [
                    Icon(Icons.person_outline),
                    SizedBox(width: 12),
                    Text('Profile'),
                  ],
                ),
                onTap: () => context.push('/profile'),
              ),
              PopupMenuItem(
                child: const Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    SizedBox(width: 12),
                    Text('Settings'),
                  ],
                ),
                onTap: () => context.push('/profile/edit'),
              ),
              PopupMenuItem(
                child: const Row(
                  children: [
                    Icon(Icons.logout_outlined),
                    SizedBox(width: 12),
                    Text('Logout'),
                  ],
                ),
                onTap: () async {
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreateOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _CreateOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

