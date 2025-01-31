

import 'package:dio/dio.dart';

class ApiServices  {
  final baseUrl = "https://fakestoreapi.com";

  Future<Response?> get(String url) async {
    try {
      final response = await Dio().get(baseUrl + url);
      return response;
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }
}