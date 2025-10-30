import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../providers/feed_provider.dart';
import '../../widgets/features/feed_post_card.dart';
import '../../widgets/common/shimmer_loading.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/navigation/staggered_list_item.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(feedPostsProvider(page: 1, perPage: 20));

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(feedPostsProvider(page: 1, perPage: 20));
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          key: const ValueKey('feed_posts_fab'),
          heroTag: 'feed_posts_fab',
          onPressed: () {
            context.push('/feed-posts/create');
          },
          child: const Icon(Icons.add),
        ),
        body: postsAsync.when(
          data: (data) {
            if (data.posts.isEmpty) {
              return const EmptyState(
                icon: Icons.article_outlined,
                title: 'No feed posts yet',
                message: 'New posts from your community will appear here',
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              itemCount: data.posts.length,
              itemBuilder: (context, index) {
                return StaggeredListItem(
                  index: index,
                  child: FeedPostCard(post: data.posts[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.xs),
            );
          },
          loading: () => const ShimmerList(itemCount: 5),
          error: (error, stack) => EmptyState(
            icon: Icons.error_outline,
            title: 'Unable to load feed',
            message: 'Please check your connection and try again',
            action: ElevatedButton(
              onPressed: () {
                ref.invalidate(feedPostsProvider(page: 1, perPage: 20));
              },
              child: const Text('Retry'),
            ),
          ),
        ),
      ),
    );
  }
}

