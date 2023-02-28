import 'package:dio/dio.dart';
import 'package:mobile_test_peraza/src/features/charger_status/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger_status/domain/repositories/charger_status_repository.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/evsy_dio_client.dart';

class ChargerStatisticsRepository implements IChargerStatisticsRepository {
  final EvsyDioClient _client;

  ChargerStatisticsRepository(EvsyDioClient client) : _client = client;

  @override
  Future<List<ChargerStatusEntity>> fetchChargerStatistics() async {
    try {
      final dynamic body = {};
      const path = 'api/status/statistics/';
      final Response response = await _client.post(path, {
        "outlet_id": body.outletId,
        "filter": body.filter,
        "day_of_week": body.dayOfWeek,
      });

      if (response.statusCode == 200) {
        return response.data['data'].map<ChargerStatusEntity>((r) {
          return ChargerStatusEntity.fromJson(r);
        }).toList();
      }

      throw Exception();
    } catch (_) {
      throw Exception();
    }
  }
}
