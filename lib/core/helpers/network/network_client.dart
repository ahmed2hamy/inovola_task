import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient({required Dio dio}) : _dio = dio {
    _dio.options = BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        });
  }

  Future<Map<String, dynamic>> getData(String path) async {
    Response response = await _dio.get(path);
    String encodedRes = jsonEncode(response.data);
    Map<String, dynamic> map = jsonDecode(encodedRes);
    return map;
  }
}
