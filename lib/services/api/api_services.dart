import 'package:tradefolioo/models/response_data.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static const String baseUrl = 'https://tradefolioo-backend.onrender.com/';
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String logout = 'auth/logout';

  static Future<ResponseData> get(String url) async {
    try {
      final response = await Dio().get(baseUrl + url);
      return ResponseData(
          data: response.data, message: 'Success', success: true);
    } on DioException catch (e) {
      return ResponseData(data: null, message: e.message, success: false);
    }
  }

  static Future<ResponseData> post(
      String url, Map<String, dynamic> data) async {
    try {
      final response = await Dio().post(baseUrl + url, data: data);
      return ResponseData(
          data: response.data, message: 'Success', success: true);
    } on DioException catch (e) {
      return ResponseData(data: null, message: e.message, success: false);
    }
  }
}
