import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_statistics_request.dart';

abstract class IChargerStatisticsRepository {
  Future<List<ChargerStatusEntity>> fetchChargerStatistics(
    ChargerStatusStatisticsRequest data,
  );
}
