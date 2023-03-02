import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/application/charger_status_notifier.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/repositories/charger_status_repository.dart';
import 'package:mobile_test_peraza/src/features/charger/infrastructure/repositories/charger_status_repository.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/evsy_client_provider.dart';

/// ********************************
/// Application dependencies
/// ********************************

// Define a StateNotifier provider for ChargerStatusNotifier, with type AsyncValue<List<ChargerStatusEntity>>
final chargerNotifierProvider = StateNotifierProvider<ChargerStatusNotifier,
    AsyncValue<List<ChargerStatusEntity>>>(
  // An anonymous function is used that receives a ref object of type ProviderRef and returns an instance of ChargerStatusNotifier
  // Provider _chargerRepositoryProvider is called to get an instance of IChargerStatusRepository
  (ref) => ChargerStatusNotifier(ref.watch(_chargerRepositoryProvider)),
);

/// ********************************
/// Infrastructure dependencies
/// ********************************

// Define a provider for the charger status repository
final _chargerRepositoryProvider = Provider<IChargerStatusRepository>((ref) {
  // Obtain an instance of the EVSY client provider
  final httpEvsyClient = ref.watch(evsyClientProvider);
  // Create a new instance of the charger status repository using the EVSY client
  return ChargerStatusRepository(httpEvsyClient);
});
