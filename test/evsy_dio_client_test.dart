import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test_peraza/src/features/common/infrastructure/datasources/remote/evsy_dio_client.dart';

void main() {
  // Defines a test group for the EvsyDioClient class.
  group('EvsyDioClient', () {
    // Defines a test for the constructor of the EvsyDioClient class.
    test('EvsyDioClient constructor sets properties correctly', () {
      // Creates a BaseOptions instance with a connect and receive timeout.
      final options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      );

      // Create an instance of EvsyDioClient with an auth token, base URL, and configuration options.
      final client = EvsyDioClient(
        token: 'my-auth-token',
        baseUrl: 'https://example.com/api',
        options: options,
      );

      // Verify that the authentication token has been set correctly.
      expect(client.token, equals('my-auth-token'));

      // Verify that the base URL has been set correctly.
      expect(client.baseUrl, equals('https://example.com/api'));

      // Verify that the connection timeout has been set correctly.
      expect(
        client.options.connectTimeout,
        equals(const Duration(milliseconds: 5000)),
      );

      // Verify that the receive timeout has been set correctly.
      expect(
        client.options.receiveTimeout,
        equals(const Duration(milliseconds: 3000)),
      );
    });

    // Test to verify that an HTTP request is being made correctly with the get method:
    test('EvsyDioClient GET request returns response with status code 200',
        () async {
      final client = EvsyDioClient(
        baseUrl: 'https://jsonplaceholder.typicode.com////',
        options: BaseOptions(
          contentType: 'application/json',
          validateStatus: (status) => true,
        ),
      );

      final response = await client.get('////todos/1/');
      expect(response.statusCode, equals(200));
    });
  });
}
