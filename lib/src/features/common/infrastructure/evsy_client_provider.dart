import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/datasources/remote/evsy_dio_client.dart';

// Create a provider called evsyClientProvider, which returns a new provider of
// type EvsyDioClient to be used to provide instances of the EvsyDioClient class
final evsyClientProvider = Provider<EvsyDioClient>(
  (ref) => EvsyDioClient(
    // Sets the base URL of the EvsyDioClient
    baseUrl: 'https://services.evsyservices.com',
    // Sets the authentication token of the EvsyDioClient
    token: '7386fe29b463bab87120fbc1518da07bff825a46',
    // Sets the options of the EvsyDioClient
    options: BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(milliseconds: 3000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  ),
);
