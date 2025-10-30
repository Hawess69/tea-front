import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../providers/men_posts_provider.dart';
import '../../widgets/features/men_post_card.dart';
import '../../widgets/common/shimmer_loading.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/navigation/staggered_list_item.dart';

class MenPostsScreen extends ConsumerWidget {
  const MenPostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(menPostsProvider(page: 1, perPage: 20));

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(menPostsProvider(page: 1, perPage: 20));
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          key: const ValueKey('men_posts_fab'),
          heroTag: 'men_posts_fab',
          onPressed: () {
            context.push('/men-posts/create');
          },
          child: const Icon(Icons.add),
        ),
        body: postsAsync.when(
          data: (data) {
            if (data.posts.isEmpty) {
              return const EmptyState(
                icon: Icons.article_outlined,
                title: 'No posts yet',
                message: 'Start sharing experiences to build your community',
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              itemCount: data.posts.length,
              itemBuilder: (context, index) {
                return StaggeredListItem(
                  index: index,
                  child: MenPostCard(post: data.posts[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.xs),
            );
          },
          loading: () => const ShimmerList(itemCount: 5),
          error: (error, stack) => EmptyState(
            icon: Icons.error_outline,
            title: 'Something went wrong',
            message: 'Unable to load posts. Please try again.',
            action: ElevatedButton(
              onPressed: () {
                ref.invalidate(menPostsProvider(page: 1, perPage: 20));
              },
              child: const Text('Retry'),
            ),
          ),
        ),
      ),
    );
  }
}

