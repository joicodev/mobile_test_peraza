import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_statistics_request.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/repositories/charger_status_repository.dart';

/// `ChargerStatusNotifier` is a state notifier that manages the state of the
/// charger status entities, used in the `ChargerStatusStatisticsConsumerWidget`.
class ChargerStatusNotifier
    extends StateNotifier<AsyncValue<List<ChargerStatusEntity>>> {
  /// Repository to handle the charger status data
  final IChargerStatusRepository _repository;

  /// Constructs a `ChargerStatusNotifier` instance with the given `IChargerStatusRepository`
  /// and an initial state of an empty list of `ChargerStatusEntity`.
  ChargerStatusNotifier(this._repository) : super(const AsyncValue.data([]));

  /// Requests charger statistics for a given day of week.
  Future<void> getStatistics(int dayOfWeek) async {
    try {
      // Changes the state to loading before the request, and then to
      state = const AsyncValue.loading();

      // Build the parameters with the ChargerStatusStatisticsRequest class
      final params = ChargerStatusStatisticsRequest(
        outletId: 56644,
        filter: "day_of_week",
        dayOfWeek: dayOfWeek,
      );

      /// data/error depending on the response.
      final result = await _repository.getChargerStatistics(params);
      state = AsyncValue.data(result);
    } catch (_) {
      /// Throws an error and changes the state to error if there was any problem with the request.
      state = AsyncValue.error('Ha ocurrido un error!', StackTrace.current);
    }
  }
}
