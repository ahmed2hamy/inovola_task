import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient({required Dio dio}) : _dio = dio{
    _dio.options =  BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        });
  }

  Future<Map<String, dynamic>> getData(String path) async {
    Response response = await _dio.get("https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34");
    Map<String, dynamic> map = jsonDecode(response.data);
    return map;
  }
}
