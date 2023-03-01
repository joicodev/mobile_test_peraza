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

  Future<void> getStatistics(int dayOfWeek) async {
    try {
      //final oldItems = state.value ?? [];
      state = const AsyncValue.loading();
      final params = ChargerStatusStatisticsRequest(
        outletId: 56644,
        filter: "day_of_week",
        dayOfWeek: dayOfWeek,
      );

      final result = await _repository.getChargerStatistics(params);
      state = AsyncValue.data(result);
    } catch (_) {
      state = AsyncValue.error('Ha ocurrido un error!', StackTrace.current);
    }
  }
}
