import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/event.dart';
import '../../data/repositories/events_repository.dart';
import 'repositories_provider.dart';

part 'events_provider.g.dart';

@riverpod
Future<EventsResponse> events(
  EventsRef ref, {
  int page = 1,
  int perPage = 20,
  bool upcoming = true,
}) async {
  final repository = ref.watch(eventsRepositoryProvider);
  return await repository.getEvents(
    page: page,
    perPage: perPage,
    upcoming: upcoming,
  );
}
