import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/notification.dart';
import '../../providers/notifications_provider.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsProvider());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notificationsAsync.when(
        data: (response) {
          final notifications = response.notifications;
          
          if (notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(notificationsProvider());
            },
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final isRead = notification.readAt != null;

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isRead ? Colors.white : AppColors.primaryLight.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isRead 
                          ? Colors.grey[300] 
                          : AppColors.primaryLight,
                      child: Icon(
                        _getNotificationIcon(notification.type),
                        color: isRead ? Colors.grey[600] : AppColors.primary,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      _getNotificationTitle(notification),
                      style: TextStyle(
                        fontWeight: isRead ? FontWeight.normal : FontWeight.w600,
                        color: isRead ? Colors.grey[700] : Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          _getNotificationMessage(notification),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: isRead ? Colors.grey[600] : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatTimestamp(notification.createdAt ?? DateTime.now()),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    trailing: !isRead
                        ? Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                    onTap: () {
                      // TODO: Navigate to related content based on notification type
                    },
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SelectableText.rich(
              TextSpan(
                style: const TextStyle(color: Colors.red),
                children: [
                  const TextSpan(text: 'Error loading notifications:\n'),
                  TextSpan(text: error.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'alert_match':
        return Icons.flag;
      case 'comment':
        return Icons.comment;
      case 'reply':
        return Icons.reply;
      case 'flag_update':
        return Icons.thumb_up;
      default:
        return Icons.notifications;
    }
  }

  String _getNotificationTitle(AppNotification notification) {
    switch (notification.type) {
      case 'alert_match':
        return 'Name Alert Matched';
      case 'comment':
        return 'New Comment';
      case 'reply':
        return 'Reply to Comment';
      case 'flag_update':
        return 'Flag Update';
      default:
        return 'Notification';
    }
  }

  String _getNotificationMessage(AppNotification notification) {
    switch (notification.type) {
      case 'alert_match':
        return notification.data.nameMatched != null
            ? 'A post was found matching "${notification.data.nameMatched}"'
            : 'A name alert matched';
      case 'comment':
        return 'Someone commented on your post';
      case 'reply':
        return 'Someone replied to your comment';
      case 'flag_update':
        return 'Someone flagged the post you are following';
      default:
        return 'You have a new notification';
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return DateFormat('MMM d, y').format(timestamp);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
