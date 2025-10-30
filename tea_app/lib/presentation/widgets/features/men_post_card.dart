import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/models/men_post.dart';
import '../../../core/constants/api_endpoints.dart';

class MenPostCard extends StatelessWidget {
  final MenPost post;

  const MenPostCard({
    super.key,
    required this.post,
  });

  String _getFullImageUrl() {
    if (post.photoUrl == null) return '';
    if (post.photoUrl!.startsWith('http')) {
      return post.photoUrl!;
    }
    // Get the base URL without /api/v1 (e.g., http://192.168.100.39:8000)
    final baseUrl = ApiEndpoints.baseUrl.replaceAll('/api/v1', '');
    // Laravel already returns /storage/posts/men/..., so just prepend base URL
    // Build full URL: http://192.168.100.39:8000/storage/posts/men/...
    final fullUrl = '$baseUrl${post.photoUrl}';
    return fullUrl;
  }

  @override
  Widget build(BuildContext context) {
    final flagCounts = post.flagCounts;
    final totalFlags = (flagCounts?.red ?? 0) +
        (flagCounts?.green ?? 0) +
        (flagCounts?.neutral ?? 0);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    post.fullName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    _showMenu(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Text(
                  post.city,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            if (post.tags != null && post.tags!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                children: post.tags!.map((tag) {
                  return Chip(
                    label: Text(tag),
                    labelStyle: const TextStyle(fontSize: 12),
                    backgroundColor: Colors.grey[200],
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 12),
            // Display image if available
            if (post.photoUrl != null && post.photoUrl!.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: _getFullImageUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  placeholder: (context, url) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.error, size: 48),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            Text(
              post.caption,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            if (flagCounts != null && totalFlags > 0) ...[
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (flagCounts.red / totalFlags),
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (flagCounts.green / totalFlags),
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (flagCounts.neutral / totalFlags),
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFlagIcon(Icons.flag, Colors.red, '${flagCounts.red}'),
                  _buildFlagIcon(Icons.flag, Colors.green, '${flagCounts.green}'),
                  _buildFlagIcon(Icons.flag, Colors.grey, '${flagCounts.neutral}'),
                ],
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    // TODO: Show comments
                  },
                  icon: const Icon(Icons.comment_outlined),
                  label: const Text('0 comments'),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.flag_outlined),
                  onPressed: () {
                    _showFlagDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlagIcon(IconData icon, Color color, String count) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(count),
      ],
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Share
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: const Text('Report'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Report submitted')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Create Alert'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Alert created!')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFlagDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Flag this post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.flag, color: Colors.red),
                title: const Text('Red Flag'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Flag submitted')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.flag, color: Colors.green),
                title: const Text('Green Flag'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Flag submitted')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.flag, color: Colors.grey),
                title: const Text('Neutral'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Flag submitted')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

