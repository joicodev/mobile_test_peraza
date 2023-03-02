import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_statistics_request.dart';

// Abstract class that defines the contract for retrieving charger status statistics from a data source.
abstract class IChargerStatusRepository {
  // The getChargerStatistics method takes in a ChargerStatusStatisticsRequest object and returns a list of ChargerStatusEntity.
  Future<List<ChargerStatusEntity>> getChargerStatistics(
    ChargerStatusStatisticsRequest data,
  );
}
