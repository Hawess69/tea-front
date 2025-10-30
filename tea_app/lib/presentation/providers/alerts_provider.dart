import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/alert.dart';
import '../../data/repositories/alerts_repository.dart';
import 'repositories_provider.dart';

part 'alerts_provider.g.dart';

@riverpod
Future<List<Alert>> alerts(AlertsRef ref) async {
  final repository = ref.watch(alertsRepositoryProvider);
  return await repository.getAlerts();
}
