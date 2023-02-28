import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/application/charger_status_notifier.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/repositories/charger_status_repository.dart';
import 'package:mobile_test_peraza/src/features/charger/infrastructure/repositories/charger_status_repository.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/evsy_client_provider.dart';

///
/// Application dependencies
///
final chargerNotifierProvider = StateNotifierProvider<ChargerStatusNotifier,
    AsyncValue<List<ChargerStatusEntity>>>(
  (ref) => ChargerStatusNotifier(ref.watch(_chargerRepositoryProvider)),
);

///
/// Infrastructure dependencies
///
final _chargerRepositoryProvider = Provider<IChargerStatusRepository>((ref) {
  final httpEvsyClient = ref.watch(evsyClientProvider);
  return ChargerStatusRepository(httpEvsyClient);
});
