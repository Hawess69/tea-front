import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/feed_repository.dart';
import '../../data/repositories/men_posts_repository.dart';
import '../../data/repositories/alerts_repository.dart';
import '../../data/repositories/events_repository.dart';
import '../../data/repositories/notifications_repository.dart';
import '../../data/repositories/profile_repository.dart';
import '../providers/auth_provider.dart';

part 'repositories_provider.g.dart';

@riverpod
FeedRepository feedRepository(FeedRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return FeedRepository(apiClient);
}

@riverpod
MenPostsRepository menPostsRepository(MenPostsRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MenPostsRepository(apiClient);
}

@riverpod
AlertsRepository alertsRepository(AlertsRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AlertsRepository(apiClient);
}

@riverpod
EventsRepository eventsRepository(EventsRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return EventsRepository(apiClient);
}

@riverpod
NotificationsRepository notificationsRepository(NotificationsRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return NotificationsRepository(apiClient);
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProfileRepository(apiClient);
}
