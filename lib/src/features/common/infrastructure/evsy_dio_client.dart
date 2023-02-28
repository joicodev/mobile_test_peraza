import 'dart:convert';
import 'package:dio/dio.dart';

class EvsyDioClient {
  String baseUrl;

  final String? token;

  final BaseOptions _baseOptions;

  Dio? _dioClient;

  EvsyDioClient({
    this.token,
    required this.baseUrl,
    required BaseOptions options,
  }) : _baseOptions = options;

  Dio get _client => _dioClient ?? Dio(_baseOptions);

  Future<Response> _invokeAPI(
    String path,
    String method, {
    Object? body,
    String? contentType,
  }) async {
    _client.options.method = method;
    _client.options.headers['Content-Type'] = contentType ?? 'application/json';
    if (token != null) {
      _client.options.headers['Authorization'] = 'Token $token';
    }

    Response response;
    try {
      final String url = '$baseUrl/$path';
      final data = body == null ? '' : json.encode(body);
      switch (method) {
        case 'POST':
          return await _client.request(url, data: data);
        default:
          return await _client.request(url);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        response = Response(statusCode: 500, requestOptions: RequestOptions());
      }
    }

    return response;
  }

  Future<Response> get(String path) => _invokeAPI(path, 'GET');

  Future<Response> post(String path, [Object? body]) =>
      _invokeAPI(path, 'POST', body: body);
}
