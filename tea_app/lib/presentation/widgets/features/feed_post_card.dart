import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/feed_post.dart';

class FeedPostCard extends StatelessWidget {
  final FeedPost post;

  const FeedPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(post.user?.name[0] ?? '?'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user?.name ?? 'Anonymous',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (post.createdAt != null)
                        Text(
                          _timeAgo(post.createdAt!),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // TODO: Show menu
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              post.body,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Upvoted!')),
                    );
                  },
                ),
                Text('${post.upvotes ?? 0}'),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Downvoted!')),
                    );
                  },
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    // TODO: Show comments
                  },
                  icon: const Icon(Icons.comment_outlined),
                  label: Text('${post.commentsCount ?? 0}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'just now';
    }
  }
}

