import 'package:dio/dio.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_statistics_request.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/repositories/status_repository.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/datasources/remote/evsy_dio_client.dart';

class ChargerStatusRepository implements IChargerStatisticsRepository {
  final EvsyDioClient _client;

  ChargerStatusRepository(EvsyDioClient client) : _client = client;

  @override
  Future<List<ChargerStatusEntity>> fetchChargerStatistics(
    ChargerStatusStatisticsRequest body,
  ) async {
    try {
      const path = 'api/status/statistics/';
      final Response response = await _client.post(path, body.toJson());
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
