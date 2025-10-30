import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/notification.dart';
import '../../data/repositories/notifications_repository.dart';
import 'repositories_provider.dart';

part 'notifications_provider.g.dart';

@riverpod
Future<NotificationsResponse> notifications(
  NotificationsRef ref, {
  int page = 1,
  int perPage = 20,
}) async {
  final repository = ref.watch(notificationsRepositoryProvider);
  return await repository.getNotifications(
    page: page,
    perPage: perPage,
  );
}
