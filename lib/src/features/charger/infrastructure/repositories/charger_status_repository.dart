import 'package:dio/dio.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_statistics_request.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/repositories/charger_status_repository.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/datasources/remote/evsy_dio_client.dart';

// Class that implements the IChargerStatusRepository interface.
// The repository is responsible for communicating with a data source (in this case, a remote API)
class ChargerStatusRepository implements IChargerStatusRepository {
  final EvsyDioClient _client;

  // Constructor that receives an instance of EvsyDioClient
  ChargerStatusRepository(EvsyDioClient client) : _client = client;

  // The getChargerStatistics function receives a ChargerStatusStatisticsRequest
  // object containing information about the request.
  @override
  Future<List<ChargerStatusEntity>> getChargerStatistics(
    ChargerStatusStatisticsRequest body,
  ) async {
    try {
      // The function makes an HTTP POST request with the data provided in the request body.
      const path = 'api/status/statistics/';
      final Response response = await _client.post(path, body.toJson());

      // If the response status code is 200 OK, parse the data and return a list of ChargerStatusEntity
      if (response.statusCode == 200) {
        return response.data['data'].map<ChargerStatusEntity>((r) {
          return ChargerStatusEntity.fromJson(r);
        }).toList();
      }

      // If the response status code is not 200, throw an Exception
      throw Exception();
    } catch (e) {
      // If there is an error, throw an Exception with the error message
      throw Exception(e.toString());
    }
  }
}
