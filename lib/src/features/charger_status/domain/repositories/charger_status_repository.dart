import 'package:mobile_test_peraza/src/features/charger_status/domain/entities/charger_status_entity.dart';

abstract class IChargerStatisticsRepository {
  Future<List<ChargerStatusEntity>> fetchChargerStatistics();
}
