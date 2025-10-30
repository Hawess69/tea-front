import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../providers/alerts_provider.dart';

class AlertsScreen extends ConsumerWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsAsync = ref.watch(alertsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Alerts'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/alerts/create');
        },
        icon: const Icon(Icons.add_alert),
        label: const Text('Create Alert'),
      ),
      body: alertsAsync.when(
        data: (alerts) {

          if (alerts.isEmpty) {
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
                    'No alerts yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create an alert to get notified when\nsomeone posts about a specific name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(alertsProvider);
            },
            child: ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final alert = alerts[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: alert.isActive
                          ? AppColors.primary
                          : Colors.grey[300]!,
                      width: alert.isActive ? 2 : 1,
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: alert.isActive
                          ? AppColors.primaryLight
                          : Colors.grey[300],
                      child: Icon(
                        alert.isActive ? Icons.notifications_active : Icons.notifications_off,
                        color: alert.isActive ? AppColors.primary : Colors.grey[600],
                        size: 20,
                      ),
                    ),
                    title: Text(
                      alert.nameToTrack,
                      style: TextStyle(
                        fontWeight: alert.isActive
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: alert.isActive ? AppColors.primary : Colors.grey[700],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              alert.isActive ? Icons.check_circle : Icons.cancel,
                              size: 14,
                              color: alert.isActive ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              alert.isActive ? 'Active' : 'Inactive',
                              style: TextStyle(
                                fontSize: 12,
                                color: alert.isActive ? Colors.green : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          alert.createdAt != null
                              ? DateFormat('MMM d, y').format(alert.createdAt!)
                              : 'N/A',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const Row(
                            children: [
                              Icon(Icons.delete_outline, size: 20),
                              SizedBox(width: 12),
                              Text('Delete'),
                            ],
                          ),
                          onTap: () async {
                            // Show confirmation dialog
                            final shouldDelete = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Alert'),
                                content: Text(
                                  'Are you sure you want to delete the alert for "${alert.nameToTrack}"?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true),
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );

                            if (shouldDelete == true && context.mounted) {
                              // TODO: Implement delete alert
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Alert deleted')),
                              );
                              ref.invalidate(alertsProvider);
                            }
                          },
                        ),
                      ],
                    ),
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
                  const TextSpan(text: 'Error loading alerts:\n'),
                  TextSpan(text: error.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
