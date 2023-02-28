import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_statistics_request.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/repositories/charger_status_repository.dart';

class ChargerStatusNotifier
    extends StateNotifier<AsyncValue<List<ChargerStatusEntity>>> {
  // Constructor ChargerStatusNotifier
  ChargerStatusNotifier(IChargerStatusRepository repository)
      : _repository = repository,
        super(const AsyncValue.data([]));

  // IChargerStatusRepository
  final IChargerStatusRepository _repository;

  Future<void> getStatistics() async {
    try {
      final oldItems = state.value ?? [];
      state = const AsyncValue.loading();
      final params = ChargerStatusStatisticsRequest(
        outletId: 56644,
        filter: "day_of_week",
        dayOfWeek: 4,
      );

      final result = await _repository.getChargerStatistics(params);
      state = AsyncValue.data(
        oldItems.where((element) => !result.contains(element)).toList(),
      );
    } catch (_) {
      state = AsyncValue.error('Ha ocurrido un error!', StackTrace.current);
    }
  }
}
