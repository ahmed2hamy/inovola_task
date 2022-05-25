import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;

  const NetworkClient({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> getData(String path) async {
    Response response = await _dio.get(path);
    return jsonDecode(response.data);
  }
}
