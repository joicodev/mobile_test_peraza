import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/datasources/remote/evsy_dio_client.dart';

final evsyClientProvider = Provider<EvsyDioClient>(
  (ref) => EvsyDioClient(
    baseUrl: 'https://services.evsyservices.com',
    token: '7386fe29b463bab87120fbc1518da07bff825a46',
    options: BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(milliseconds: 3000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  ),
);
