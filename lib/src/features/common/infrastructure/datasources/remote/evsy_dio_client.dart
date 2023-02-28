// Library for encoding and decoding JSON objects.
import 'dart:convert';
// Library for making HTTP requests.
import 'package:dio/dio.dart';

// Defines a class called EvsyDioClient.
class EvsyDioClient {
  // Base URL for all requests.
  String baseUrl;

  // Optional authorization token for all requests.
  final String? token;

  // Base configuration options for all requests.
  final BaseOptions _baseOptions;

  // Dio HTTP client.
  Dio? _dioClient;

  // Constructor for the EvsyDioClient class.
  EvsyDioClient({
    this.token,
    required this.baseUrl,
    required BaseOptions options,
  }) : _baseOptions = options;

  // Getter that returns an instance of the Dio HTTP client.
  Dio get _client => _dioClient ?? Dio(_baseOptions);

  // Private method used to invoke an HTTP API.
  Future<Response> _invokeAPI(
    String path,
    String method, {
    Object? body,
    String? contentType,
  }) async {
    // Configuring the Dio HTTP client options.
    _client.options.method = method;
    _client.options.headers['Content-Type'] = contentType ?? 'application/json';
    if (token != null) {
      _client.options.headers['Authorization'] = 'Token $token';
    }

    // Making the HTTP request using the Dio HTTP client.
    Response response;
    try {
      // Constructs the HTTP request URL from the provided baseUrl and path.
      final String url = '$baseUrl/$path';
      // Encodes the request body in JSON format.
      final data = body == null ? '' : json.encode(body);
      // Makes the HTTP request using the Dio library, with the provided data.
      switch (method) {
        case 'POST':
          return await _client.request(url, data: data);
        default:
          return await _client.request(url);
      }
    } on DioError catch (e) {
      // Handles any errors that occur during the HTTP request.
      if (e.response != null) {
        response = e.response!;
      } else {
        response = Response(statusCode: 500, requestOptions: RequestOptions());
      }
    }

    return response;
  }

  // Public method used to make HTTP GET requests.
  Future<Response> get(String path) => _invokeAPI(path, 'GET');

  // Public method used to make HTTP POST requests.
  Future<Response> post(String path, [Object? body]) =>
      _invokeAPI(path, 'POST', body: body);
}
